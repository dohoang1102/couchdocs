#redirect HTTP_database_API
An introduction to the CouchDB HTTP database API.

== Naming and Addressing ==

A database must be named with all lowercase characters (a-z), digits (0-9), or any of the ''_$()+-/'' characters and must end with a slash in the URL. The name has to start with characters.

{{{
http://couchserver/databasename/
http://couchserver/another/databasename/
http://couchserver/another/database_name(1)/
}}}

''Uppercase characters are NOT ALLOWED in database names.''

{{{
http://couchserver/DBNAME/ (invalid)
http://couchserver/DatabaseName/ (invalid)
http://couchserver/databaseName/ (invalid)
}}}

Note also that a ''/'' character in a DB name must be escaped when used in a URL; if your DB is named ''his/her'' then it will be available at ''http://localhost:5984/his%2Fher''.

''Rationale for character restrictions''

The limited set of characters for database names is driven by the need to satisfy the lowest common denominator for file system naming conventions. For example, disallowing uppercase characters makes compliance with case insensitive file systems straightforward.

== List Databases ==

To get a list of databases on a CouchDB server, use the ''/_all_dbs'' URI:

{{{
GET /_all_dbs HTTP/1.01
Date: Thu, 17 Aug 2006 05:39:28 +0000GMT
}}}

And the response:

{{{
HTTP/1.1 200 OK
Date: Thu, 17 Aug 2006 05:39:28 +0000GMT
Content-Length: 37
Content-Type: application/json
Connection: close

["somedatabase", "anotherdatabase"]
}}}

== PUT (Create New Database) ==

To create a new empty database, perform a PUT operation at the database URL. Currently the content of the actual PUT is ignored by the webserver.

On success, HTTP status ''201'' is returned. If a database already exists a ''409'' error is returned.

{{{
PUT /somedatabase/ HTTP/1.0
Content-Length: 0
Date: Thu, 17 Aug 2006 05:39:28 +0000GMT
}}}

Here is the server's response:

{{{
HTTP/1.1 201 OK
Date: Thu, 17 Aug 2006 05:39:28 +0000GMT
Content-Length: 13
Content-Type: application/json
Connection: close

{"ok": true}
}}}

== DELETE ==

To delete a database, perform a DELETE operation at the database location.

On success, HTTP status ''200'' is returned. If the database doesn't exist, a ''404'' error is returned.

{{{
DELETE /somedatabase/ HTTP/1.0
Content-Length: 1
Date: Thu, 17 Aug 2006 05:39:28 +0000GMT
}}}

Here is the server's response:

{{{
HTTP/1.1 200 OK
Date: Thu, 17 Aug 2006 05:39:28 +0000GMT
Content-Length: 67
Content-Type: application/json
Connection: close

{"ok": true}
}}}

== Database Information ==

To get information about a particular database, perform a GET operation on the database, e.g.:

{{{
GET /somedatabase/ HTTP/1.0
}}}

The server's response is a JSON object similar to the following:

{{{
{"db_name": "dj", "doc_count":5, "doc_del_count":0, "update_seq":13, "compact_running":false, "disk_size":16845}
}}}

== Compaction ==

Databases may be compacted to reduce their disk usage.  For more details, see [[Compaction]].
