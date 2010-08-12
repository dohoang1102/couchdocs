#redirect Open_items
Open items related to the CouchDB project that anyone can work on.

== Documentation Graphics ==

The documentation, especially the introductions, could use some basic diagrams that show various the parts of a CouchDB server: Host OS, Application HTTP server, CouchDB database server (Server contains database which contain document which contain computed tables etc).

== Configuration ==

Note: This is currently being worked on. Check with the couchdb-dev (http://incubator.apache.org/couchdb/community/lists.html) mailing list for a status.

CouchDB needs a configuration/setting process that loads and parses the ''couch.ini'' file and provides the interface for internal processes to get and set couchdb system settings. This way admins can changes settings from the Erlang consol and via http.

The module should be able to write out changes (variable edits, additions, and deletions) to the ini file without losing whitespace or comments in the original file. It should be possible to register change event callbacks, so that callers can be notified when a value changes.

== Collation Optimizations ==

Right now CouchDB uses the [[http://www.icu-project.org/|ICU library]] from IBM for collation support. CouchDB currently uses a rather slow method of interfacing with the library, which is to copy the UTF8 string lists to binary buffers and then provide the buffers to ICU to do the comparison. More optimized methods of interfacing with ICU could be used, or just do the collation in native erlang using generated code to create the collation tables.
