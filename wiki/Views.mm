#redirect Introduction_to_CouchDB_views
A simple introduction to CouchDB views.

== Concept ==

Views are the primary tool used for querying and reporting on CouchDB documents. There are two different kinds of views: permanent and temporary views.

'''Permanent views''' are stored inside special documents called design documents, and can be accessed via an HTTP ''GET'' request to the URI ''/{dbname}/{docid}/{viewname}'', where ''{docid}'' has the prefix ''_view/'' so that CouchDB recognizes the document as a design document.

'''Temporary views''' are not stored in the database, but rather executed on demand. To execute a temporary view, you make an HTTP ''POST'' request to the URI ''/{dbname}/_temp_view'', where the body of the request contains the code of the view function and the ''Content-Type'' header is set to ''application/json''.

'''NOTE''': Temporary views are only good during development. Final code should not rely on them as they are very expensive to compute each time they get called and they get increasingly slower the more data you have in a database. If you think you can't solve something in a permanent view that you can solve in an ad-hoc view, you might want to reconsider. (TODO: add typical examples and solutions).

For both kinds of views, the view is defined by a !JavaScript function that maps view keys to values (although it is possible to use other languages than !JavaScript by plugging in third-party view servers).

Note that by default views are not created and updated when a document is saved, but rather, when it is accessed. As a result, the first access might take some time depending on the size of your data while CouchDB creates the view. If preferable the views can also be updated when a document is saved using an external script that calls the views when updates have been made. An example can be found here: RegeneratingViewsOnUpdate

Note that all views in a single design document get updated when one of the views in that design document gets queried. 

Note on !JavaScript API change: Prior to Tue, 20 May 2008 (Subversion revision r658405) the function to emit a row to the map index, was named "map". It has now been changed to "emit".

== Basics ==

=== Map Functions ===

Here is the simplest example of a map function:

{{{
function(doc) {
  emit(null, doc);
}
}}}

This function defines a table that contains all the documents in a CouchDB database, with no particular key.

A view function should accept a single argument: the document object. To produce results, it should call the implicitly available ''emit(key, value)'' function. For every invocation of that function, a result row is added to the view (if neither the ''key'' nor the ''value'' are undefined). As documents are added, edited and deleted, the rows in the computed table are updated automatically.

Here is a slightly more complex example of a function that defines a view on values computed from customer documents:

{{{
function(doc) {
  if (doc.Type == "customer") {
    emit(null, {LastName: doc.LastName, FirstName: doc.FirstName, Address: doc.Address});
  }
}
}}}

For each document in the database that has a Type field with the value ''customer'', a row is created in the view. The ''value'' column of the view contains the ''!LastName'', ''!FirstName'', and ''Address'' fields for each document. The key for all the documents is null in this case.

To be able to filter or sort the view by some document property, you would use that property for the key. For example, the following view would allow you to lookup customer documents by the ''!LastName'' or ''!FirstName'' fields:

{{{
function(doc) {
  if (doc.Type == "customer") {
    emit(doc.LastName, {FirstName: doc.FirstName, Address: doc.Address});
    emit(doc.FirstName, {LastName: doc.LastName, Address: doc.Address});
  }
}
}}}

Here is an example of the results of such a view:

{{{
{
   "total_rows":4,
   "offset":0,
   "rows":
   [
     {
       "id":"64ACF01B05F53ACFEC48C062A5D01D89",
       "key":"Katz",
       "value":{"FirstName":"Damien", "Address":"2407 Sawyer drive, Charlotte NC"}
     },
     {
       "id":"64ACF01B05F53ACFEC48C062A5D01D89",
       "key":"Damien",
       "value":{"LastName":"Katz", "Address":"2407 Sawyer drive, Charlotte NC"}
     },
     {
       "id":"5D01D8964ACF01B05F53ACFEC48C062A",
       "key":"Kerr",
       "value":{"FirstName":"Wayne", "Address":"123 Fake st., such and such"}
     },
     {
       "id":"5D01D8964ACF01B05F53ACFEC48C062A",
       "key":"Wayne",
       "value":{"LastName":"Kerr", "Address":"123 Fake st., such and such"}
     },
   ]
}
}}}

''This example output was reformatted for readability.''

=== Reduce Functions ===

'''This section is only a stub.  Please help by expanding it.'''

Here is an example of a reduce function:

{{{
function (keys, values, combine) {
    return sum(values);
}
}}}

Reduce functions should return a single scalar value.

== Lookup Views ==

The second parameter of the ''emit()'' function can be ''NULL''. CouchDB then only stores the key in the view. If you use the document's ID here, you can use the view as a compact lookup mechanism and fetch the document's details, if needed, in subsequent requests.

== Complex Keys ==

Keys are not limited to simple values. You can use arbitrary JSON values to influence sorting. See ViewCollation for the rules.

== Views in Practice ==

See HttpViewApi to learn how to work with views.
