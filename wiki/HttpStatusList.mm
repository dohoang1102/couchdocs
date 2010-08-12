#redirect HTTP_status_list
A list of HTTP statuses used by CouchDB and their respective meanings.

=== 200 - OK ===

Request completed successfully.

=== 304 - Not Modified ===

Etag not modified since last update.

=== 400 - Bad Request ===

Request given is not valid in some way.

=== 404 - Not Found ===

Such as a request via the HttpDocumentApi for a document which doesn't exist.

=== 406 - Not Acceptable ===

Request contained invalid JSON.

=== 409 - Conflict ===

Request attempted to created database which already exists.

=== 412 - Precondition Failed ===

Request resulted in an update conflict.

=== 500 - Internal Server Error ===

Woops.

''As you can see, this document is incomplete, please update.'''
