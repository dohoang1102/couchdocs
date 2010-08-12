#redirect HTTP_view_API
An introduction to the CouchDB HTTP view API.

== Basics ==

Views are the primary tool used for querying and reporting on Couch documents.

Views are defined with Javascript functions. Here is the very simplest function:

{{{
function(doc) {
  emit(null, doc);
}
}}}

See [[Views]] for more information.

== Creating Views ==

To create a permanent view, the functions must first be saved into special ''design documents'' (well, they are not really special, we just call them special but in reality, they are regular documents, just with a special ID). The IDs of design documents must begin with ''_design/'' and have a special views attribute that have a ''map'' member and an optional ''reduce'' member to hold the view functions. All the views in one design document are indexed whenever any of them gets queried.

A design document that defines ''all'', ''by_lastname'', and ''total_purchases'' views might look like this:

{{{
{
  "_id":"_design/company",
  "_rev":"12345",
  "language": "javascript",
  "views":
  {
    "all": {
      "map": "function(doc) { if (doc.Type == 'customer')  emit(null, doc) }"
    },
    "by_lastname": {
      "map": "function(doc) { if (doc.Type == 'customer')  emit(doc.LastName, doc) }"
    },
    "total_purchases": {
      "map": "function(doc) { if (doc.Type == 'purchase')  emit(doc.Customer, doc.Amount) }",
      "reduce": "function(keys, values) { return sum(values) }"
    }
  }
}
}}}

The ''language'' property tells CouchDB the language of the view functions, which it uses to select the appropriate ViewServer (as specified in your couch.ini file). The default is to assume Javascript, so this property can be omitted for Javascript views.

== Altering/Changing Views ==

To change a view or multiple view just alter the document (see HttpDocumentApi) they are stored in and save it as a new revision.

== Access/Query ==

Once this document is saved into a database, then the ''all'' view can be retrieved at the URL:

  http://localhost:5984/database/_view/company/all

Example:

{{{
GET /some_database/_view/company/all HTTP/1.0
Date: Thu, 17 Aug 2006 05:39:28 +0000GMT
}}}

And will result in the following response:

{{{
 HTTP/1.1 200 OK
 Date: Thu, 17 Aug 2006 05:39:28 +0000GMT
 Content-Length: 318
 Connection: close

 {
    "total_rows": 3,
    "offset": 0,
    "rows": [{
        "id":"64ACF01B05F53ACFEC48C062A5D01D89",
        "key": null,
        "value": {
          "LastName":"Katz",
          "FirstName":"Damien",
          "Address":"2407 Sawyer drive, Charlotte NC",
          "Phone":012555754211
        }
      }, {
        "id":"5D01D8964ACF01B05F53ACFEC48C062A",
        "key": null,
        "value": {
          "LastName":"Kerr",
          "FirstName":"Wayne",
          "Address":"123 Fake st., such and such",
          "Phone":88721320939
        }
      }, {
        "id":"EC48C062A5D01D8964ACF01B05F53ACF",
        "key": null,
        "value":
        {
          "LastName":"McCracken",
          "FirstName":"Phil",
          "Address":"1234 Fake st., such and such",
          "Phone":7766552342
        }
      }
    ]
 }
}}}

== Temporary Views ==

One-off queries (eg. views you don't want to save in the CouchDB database) can be done via the special view ''_temp_view''. Temporary views are only good during development. Final code should not rely on them as they are very expensive to compute each time they get called and they get increasingly slower the more data you have in a database. If you think you can't solve something in a permanent view that you can solve in an ad-hoc view, you might want to reconsider. (TODO: add typical examples and solutions).

{{{
POST /some_database/_temp_view  HTTP/1.0
Content-Length: 48
Date: Mon, 10 Sep 2007 17:11:10 +0200
Content-Type: application/json

{
  "map" : "function(doc) { if (doc.foo=='bar') { emit(null, doc.foo); } }"
}

}}}

Could result in the following response:

{{{
{
  "total_rows": 1,
  "offset": 0,
  "rows": [{
      "id": "AE1AD84316B903AD46EF396CAFE8E50F",
      "key": null,
      "foo": "bar"
    }
  ]
}
}}}

== Querying Options ==

Columns can be a list of values, there is no set limit to the number of values or amount of data that columns can hold.

The following URL query arguments are allowed:

  * GET
    * key=keyvalue
    * startkey=keyvalue
    * startkey_docid=docid
    * endkey=keyvalue
    * endkey_docid=docid
    * count=max rows to return
    * update=false
    * descending=true
    * skip=number of rows to skip
    * group=true ''Version 0.8.0 and forward''
    * reduce=false ''Trunk only (0.9)''
    * include_docs=true ''Trunk only (0.9)''
  * POST
    * {"keys": ["key1", "key2", ...]} ''Trunk only (0.9)''

''key'', ''startkey'', and ''endkey'' need to be properly JSON encoded values (for example, startkey="string" for a string value).

A JSON structure of ''{"keys": ["key1", "key2", ...]}'' can be posted to any user defined view or ''_all_docs'' to retrieve just the view rows matching that set of keys. Rows are returned in the order of the keys specified. Combining this feature with ''include_docs=true'' results in the so-called ''multi-document-fetch'' feature.

If you specify ''?count=0'' you don't get any data, but all meta-data for this View. The number of documents in this View for example. If ''count'' is specified as a negative number, you will receive that many documents prior to the specified ''startkey''.

The ''skip'' option should only be used with small values, as skipping a large range of documents this way is inefficient (it scans the index from the startkey and then skips N elements, but still needs to read all the index values to do that). For efficient paging use ''startkey'' and/or ''startkey_docid''.

The ''update'' option can be used for higher performance at the cost of possibly not seeing the all latest data. If you set the ''update'' option to ''false'', CouchDB will not perform any refreshing on the view that may be necessary.

View rows are sorted by the key; specifying ''descending=true'' will reverse their order. Note that the ''descending'' option is applied before any key filtering, so you may need to swap the values of the ''startkey'' and ''endkey'' options to get the expected results. The sorting itself is described in ViewCollation.

The ''group'' option controls whether the reduce function reduces to a set of distinct keys or to a single result row.

If a view contains both a map and reduce function, querying that view will by default return the result of the reduce function. The result of the map function only may be retrieved by passing ''reduce=false'' as a query parameter.

The ''include_docs'' option will include the associated document. Although, the user should keep in mind that there is a race condition when using this option. It is possible that between reading the view data and fetching the corresponding document that the document has changed. If you want to alleviate such concerns you should emit an object with a _rev attribute as in ''emit(key, {"_rev": doc._rev})''. This alleviates the race condition but leaves the possiblity that the returned document has been deleted (in which case, it includes the ''"_deleted": true'' attribute).


== Debugging Views ==

When creating views, CouchDB will check the syntax of the submitted JSON, but the view functions themselves will not be syntax checked by the Javascript interpreter. And if any one of the view functions has a syntax error, none of the view functions in that design document will execute. Perhaps test your functions in a temporary view before saving them in the database.

As of r660140 there is a log function available in the views, which logs to the couch.log. It can be helpful for debugging but hinders performance, so it should be used sparingly in production systems.

{{{
{
  "map": "function(doc) { log(doc); }"
}
}}}
