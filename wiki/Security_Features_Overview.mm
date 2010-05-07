= Security Features Overview =
<<TableOfContents()>>

An overview of security features focusing on what CouchDB provides out of the box.

== Authentication ==
CouchDB ships with basic authentication that compares user credentials to Admin accounts. See [[Setting_up_an_Admin_account]] for more details.

You can specify a custom authentication handler and the web authentication scheme in the configuration file. The example below specifies that CouchDB will use the default_authentication_handler method defined in the [[http://svn.apache.org/viewvc/couchdb/trunk/src/couchdb/couch_httpd.erl?view=markup|couch_httpd]] module:

{{{
authentication_handler = {couch_httpd, default_authentication_handler}
WWW-Authenticate = Basic realm="administrator"
}}}

Other notes: The "null_authentication_handler" in "couch_httpd" allows any user credentials to run as admin. Web servers such as Apache or Nginx can also provide an authentication layer as a reverse-proxy to CouchDB.

== Authorization ==
CouchDB supports one role, the "admin" group, which can execute any of the HTTP API on any database in the CouchDB instance. See [[Setting_up_an_Admin_account]] for more details.

CouchDB does not support other roles at this time. Support for read access restriction is planned for the 1.0 release. 

== Validation ==

See [[Document_Update_Validation]].
