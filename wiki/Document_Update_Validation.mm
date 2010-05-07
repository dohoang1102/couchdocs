= Document Update Validation =
<<TableOfContents()>>

A design document may define a member function called "validate_doc_update". Requests to create or update a document are validated against every "validate_doc_update" function defined in the database. The validation functions are executed in an unspecified order. A design document can contain only one validation function. Errors are thrown as javascript objects. 

Example of a design document that validates the presence of an "address" field and returns :

{{{#!highlight javascript
{
   _id: "_design/myview",
   validate_doc_update: "function(newDoc, oldDoc, userCtx) {
      if(newDoc.address === undefined) {
         throw {forbidden: 'Document must have an address.'};
      }"
}
}}}

The result of a document update without the address field will look like this:
{{{
HTTP/1.1 403 Forbidden
WWW-Authenticate: Basic realm="administrator"
Server: CouchDB/0.9.0 (Erlang OTP/R12B)
Date: Tue, 21 Apr 2009 00:02:32 GMT
Content-Type: text/plain;charset=utf-8
Content-Length: 57
Cache-Control: must-revalidate

{"error":"forbbiden","reason":"Document must have an address."} 
}}}


The "validate_doc_update" function accepts three arguments:
 1. newDoc - The document to be created or used for update.
 1. oldDoc - The current document if document id was specified in the HTTP request
 1. userCtx - User context object, which contains three properties:
   a. db - String name of database
   a. name - String user name
   a. roles - Array of roles to which user belongs. Currently only admin role is supported.
