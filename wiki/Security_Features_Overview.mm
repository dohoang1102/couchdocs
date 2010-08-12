= Security Features Overview =
<<TableOfContents()>>

An overview of the security features that CouchDB 0.11 provides out of the box.

== Authentication ==

CouchDB 0.11 ships with several authentication handlers:

 * OAuth authentication handler

 * cookie authentication handler (the cookie is a timestamped and tamper-proof token)

 * default authentication handler (looks for HTTP basic authentication as defined by RFC 2617)

For each HTTP request that CouchDB receives, one or more authentication handlers are invoked to authenticate the user. Once an authentication handler succeeds, the remaining ones are not executed. Which authentication handlers are used, as well as the order under which they will be invoked, is defined in the .ini configuration files. The default setting, from the etc/couchdb/default.ini file, is:

{{{
[httpd]
authentication_handlers = {couch_httpd_oauth, oauth_authentication_handler}, {couch_httpd_auth, cookie_authentication_handler}, {couch_httpd_auth, default_authentication_handler}
}}}

'''Note:''' for testing purposes the authentication handler ''{couch_httpd_auth, null_authentication_handler}'' can be used. It authenticates any request as being being originated by a server admin user.

== Authorization ==

As of CouchDB 0.11, three types of users can be defined:

  * database readers - Defined per database. They can read all types of documents from the DB, and they can write (and edit) documents to the DB except for design documents.

  * database admins - Defined per database. They have all the privileges readers have plus the privileges: write (and edit) design documents, add/remove database admins and readers, set the database revisions limit (''/somedb/_revs_limit'' API) and execute temporary views against the database (''/somedb/_temp_view'' API). They can not create a database and neither delete a database.

  * server admins - Defined per CouchDB server. They have all the privileges.

Server admins are defined in the ''admins'' section of the .ini configuration files. See [[Setting_up_an_Admin_account]] for more details.

Database admins and readers are defined in the security object of a database. This security object, located under "/db_name/_security" in CouchDB version 0.11 and above, is a JSON document having the following structure:

{{{
{
  "admins" : {
     "names" : ["joe", "phil"],
     "roles" : ["boss"]
   },
   "readers" : {
     "names" : ["dave"],
     "roles" : ["producer", "consumer"]
   }
}
}}}

Note that security objects are not regular versioned documents (that is, they are not under MVCC rules). This is a design choice to speedup authorization checks (avoids traversing a database's documents B-Tree).

If both the names and roles fields of either the admins or readers properties are empty arrays, it means the database has no admins or readers. Having no admins, only server admins (with the reserved _admin role) are able to update design document and make other admin level changes. Having no readers, any user can write regular documents (any non-design document) and read documents from the database.

'''Note:''' If there are any reader names or roles defined for a database, then only authenticated users having a matching name or role are allowed to read documents from the database (or do a GET /db_name/ call).

Each user name mentioned in a database security object refers to a user that is defined in the authentication database. The default name of this database is ''_users'' but it is configurable in the .ini configuration files:

{{{
[couch_httpd_auth]
authentication_db = _users
require_valid_user = false
}}}

The ''require_valid_user'' configuration parameter shown above causes CouchDB to have the following behaviour:

  1. No server admins are configured:
    1. ''require_valid_user'' is set to false: the request will be validated (by the handler ''{couch_httpd_auth, default_authentication_handler}'') as if it originated from a server admin, but only if the handler did not found any authentication credentials in the user's HTTP request message
    1. ''require_valid_user'' is set to true: if none of the configured authentication handlers succeeds, an HTTP message with error code 401 (unauthorized) will be sent back to the requester

  1. There are one or more server admins configured:
    1. ''require_valid_user'' is set to false: the request will be validated as "anonymous" (unnamed user, no roles)
    1. ''require_valid_user'' is set to true: if none of the configured authentication handlers succeeds, an HTTP message with error code 401 (unauthorized) will be sent back to the requester

Currently the documents in the authentication database can only have the type attribute set to "user". Such documents have the following structure:

{{{
{
  "_id"          : "org.couchdb.user:joe",
  "type"         : "user",
  "name"         : "joe",
  "roles"        : ["erlanger"],
  "password_sha" : "fe95df1ca59a9b567bdca5cbaf8412abd6e06121",
  "salt"         : "4e170ffeb6f34daecfd814dfb4001a73"
}
}}}

The "_id" attribute value must be prefixed with the string "org.couchdb.user:" and the rest must match the value of the attribute "name". The roles attribute must be an array of roles (and each role is a string). The "password_sha" attribute is an hexadecimal representation of the SHA-1 hash computed over a string that matches the user password concatenated with a salt (ideally a random string). The salt attribute is the hexadecimal representation of the salt used to generate the user's password hash.

Some rules regarding user documents:

  * when created by a non server admin user, the "roles" attribute must be an empty array

  * a non server admin user can only update his own user document

  * when updated by a non server admin user, the "roles" attribute must remain unchanged

  * role names can not start with an underscore - such role names are used for system roles

  * user names can not start with an underscore - such user names are reserved for internal system operations

Finally, server admins can create user documents that represent themselves. This is useful if server admins (which always have the role "_admin") want to have other roles (application specific roles). User documents that represent server admins do not need to have the "password_sha" and "salt" attributes defined - their authentication credentials are stored in the .ini configuration files.

All these rules regarding authentication database documents are enforced by the validate document update function stored in the design document with ID "_design/_auth" found in the authentication database (it is automatically created by CouchDB).

== Document Update Validation ==

See [[Document_Update_Validation]].
