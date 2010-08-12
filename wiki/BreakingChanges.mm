#redirect Breaking_changes
This page documents backwards-incompatible changes made during the evolution of CouchDB. While not all such changes will necessarily affect all users, most of them probably will. This page should show you what changed and how you'll need to adapt your code.

== Changes Between 0.7.x and 0.8.0 ==

=== Database File Format ===

The database file format has changed. CouchDB itself does yet not provide any tools for migrating your data. In the meantime, you can use third-party scripts to deal with the migration, such as the dump/load tools that come with the development version (trunk) of [[http://code.google.com/p/couchdb-python/|couchdb-python]].

==== Migration Using the couchdb-python `dump`/`load` Tools ====

First, some important notes on the way these tools operate:
 * They work on a per-database basis, meaning you'll need to migrate all databases individually.
 * The dump tool retrieves all documents, including attachments, from a database and writes them to standard output in MIME multipart format.
 * The load tool expects that MIME multipart on the standard input stream, and recreates all the documents (including attachments) it contains. It should be used with an empty target database.
 * Documents of course retain their unique identifiers.
 * The revision history of the documents is completey discarded.

'''Note''': ''Do not upgrade CouchDB until you've gotten your data out using the procedure described below!''

'''Also note''': ''Please keep backups of both the original database files and the dump files, at least until you've verified that the migration worked completely.''

To use the tools, you'll have to install `couchdb-python` (currently from trunk), which in turn requires [[http://www.python.org/|Python 2.4]] and the [[http://code.google.com/p/httplib2/|httplib2]] and [[http://cheeseshop.python.org/pypi/simplejson|simplejson]] packages.

On the shell, enter the directory into which you checked out the `couchdb-python` code. First run to make sure the package is installed:

{{{
  ./setup.py install
}}}

Now, to dump the contents of a particular database into a file, run the following command:

{{{
  python couchdb/tools/dump.py http://127.0.0.1:5984/dbname > dbname.dump
}}}

Replace '''dbname''' with the name of the database to dump. This will create a file called `dbname.dump` in the current directory.

After you've done this for all the databases you want to migrate, you can upgrade CouchDB. You will need to completely clear the directory where CouchDB stored the old databases, as it will probably choke on files using the old format.

After the upgrade you can import all the data you previously exported. First, you'll need to create an empty database for every database dump you want to import. Then you execute the `load.py` script from the command-line as follows:

{{{
  python couchdb/tools/load.py http://127.0.0.1:5984/dbname < dbname.dump
}}}

Do that for all your databases, and you should be set. Please report any bugs in those scripts [[http://code.google.com/p/couchdb-python/issues/list|here]].

=== Document Structure Changes ===

In the JSON structure for attachments, the member name `content-type` has been changed to `content_type` (note the underscore). This change was made for consistency with the general naming scheme in CouchDB, and enable easier access from Javascript code.

=== View Definition Changes ===

Views now support optional reduce. For this to work, the structure of view definitions in design documents had to change. An example is probably the best way to illustrate this:

{{{
  {
    "_id":"_design/foo",
    "language":"javascript",
    "views": {
      "bar": {
        "map":"function... ",
        "reduce":"function..."
      }
    }
  }
}}}

Notable changes are the usage of a JSON object to define both the map and the reduce function instead of just a string for the map function. The `reduce` member may be omitted.

The `language` member is no longer a MIME type, instead, only the language name is specified. The language name maps exactly to the name chosen for a view server registration in `couch.ini`.

The `map(key, value)` function that map functions would use to produce output has been renamed to `emit(key, value)` to avoid confusion.

{{{
  function(doc) {
    emit(doc.foo, doc.bar);
  }
}}}

Temporary views now need to get `POST`ed a JSON document with `map` and `reduce` members instead of just `POST`ing the raw source of the map function:

{{{
  {
    "map":"function...",
    "reduce":"function..."
  }
}}}

Note that the language of the temporary view is no longer determined by the `Content-Type` header of the HTTP request. Since the definition is a JSON object, the `Content-Type` is always `application/json`. The view language is now specified via an optional `language` member in the JSON request body. If omitted, the language defaults to "javascript".

{{{
  {
    "language":"javascript"
    "map":"function...",
    "reduce":"function..."
  }
}}}

=== HTTP API Changes ===

=== DELETE Status Code ===

Successful deletion of a database or document using the `DELETE` HTTP method now results in a `200 OK` response instead of the `202 Accepted` response used before. The rationale for this change is that the deletion is performed immediately, while a 202 status code implies that the action has been triggered but may not have completed at the time of the response.

==== Bulk Updates ====

The JSON structure for bulk updates has been changed slightly for both requests and responses.

For requests, you previously posted a JSON array of document rows. Now, you post a JSON object with a `docs` member containing that array:

{{{
  {
    "docs": [
      {"_id": "foo", "_rev": "123456", "title": "Foo"},
      {"_id": "bar", "_rev": "234567", "title": "Bar"}
    ]
  }
}}}

Responses used to have a JSON object with a `results` member. Now, the response JSON structure looks as follows:

{{{
  {
    "ok": true,
    "new_revs": [
      {"_id": "foo", "rev": "345678"},
      {"_id": "bar", "rev": "456789"}
    ]
  }
}}}

''Note that bulk updates are now transactional: either all updates succeed or all fail. That's why the `ok` member moved to the top-level of the response.''
