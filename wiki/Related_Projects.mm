= Related Projeccts =
<<TableOfContents()>>

A list of CouchDB related projects, clients and libraries.

== Clients ==
  * [[http://github.com/couchapp/couchapp/|Couchapp]] Command line tool to manage standalone CouchDB applications and send/clone documents from/to CouchDB.
  * [[http://janl.github.com/couchdbx/|CouchDBX — The one-click CouchDB package for the Mac]]
    * nightly builds are available here: [[http://couch.lstoll.net/nightly/]]
  * [[http://objectiveous.github.com/davenport/|Davenport: Davenport is a plugin container for building native Mac OS X applications]]
  * [[http://code.google.com/p/couchdb-fuse/|CouchDB-FUSE: mount document attachments on a virtual filesystem]]
  * [[http://github.com/paulcarey/fuschia/tree/master|Fuschia is a graphical document browser for CouchDB]]

  * Out of date
    * [[http://dansickles.blogs.com/weblog/2006/09/levitz.html|Levitz - XUL based CouchDb utility client]]
    * [[Valance]] GUI client in PyGTK

== Libraries ==

  * JavaScript libraries
    * [[http://svn.apache.org/viewvc/couchdb/trunk/share/www/script/couch.js|CouchDB's built-in synchronous JS library for the test suite]]
    * [[http://svn.apache.org/viewvc/couchdb/trunk/share/www/script/jquery.couch.js|CouchDB's built-in asynchronous jQuery plugin]]
    * [[http://jquery.com/plugins/project/jqcouch|jQuery CouchDB Library]]

  * Erlang interfaces:
    * [[http://github.com/benoitc/couchbeam/tree/master|Erlang CouchDB Kit using Erlang messages instead of HTTP]]
    * [[http://code.google.com/p/erlcouch/|Erlang interface to CouchDB]]
    * [[http://github.com/ngerakines/erlang_couchdb/|erlang_couchdb]]
    * [[http://code.google.com/p/ecouch/|eCouch]]

  * Java interfaces:
    * [[http://code.google.com/p/ektorp/|Ektorp CouchDB connector]]
    * [[http://code.google.com/p/couchdb4j/|CouchDB4J Java bindings]]

  * Scala driver and View Server:
    * [[http://github.com/debasishg/scouchdb|scouchdb Scala bindings]]

  * Perl interfaces:
    * [[http://search.cpan.org/dist/Net-CouchDB/|Net::CouchDb]]
    * [[http://search.cpan.org/dist/CouchDB-Client/|CouchDB::Client]]
    * [[http://search.cpan.org/dist/POE-Component-Client-CouchDB/|POE::Component::Client::CouchDB]]

  * Perl tools:
    * [[http://search.cpan.org/dist/CouchDB-View/|CouchDB::View, handling Perl views on both the client and server sides]]
    * [[http://search.cpan.org/dist/CouchDB-Deploy/|CouchDB::Deploy, simple configuration to help deploy applications that use CouchDB]]

  * PHP libraries
    * [[http://kore-nordmann.de/projects/phpillow/index.html|PHPillow]], an object orientated wrapper for CouchDB.
    * [[http://www.phpcouch.org/|PHPCouch, a CouchDB library for PHP]]
    * [[http://svn.pollinimini.net/couchphp/trunk/|PHP library for CouchDb]]
    * [[http://www.topdog.za.net/php_couchdb_extension|PHP extension for CouchDB]]

  * Ruby libraries
    * [[http://github.com/mattetti/couchrest/tree|CouchRest The base library for most Ruby CouchDB libraries]]
    * [[http://github.com/langalex/couch_potato|CouchPotato integrates Rails and CouchDB]]
    * [[http://github.com/georgepalmer/couch_foo|CouchFoo (ActiveRecord matching API to CouchDB)]]
    * [[http://couchobject.rubyforge.org/|CouchObject (Ruby client + JsServer for views in Ruby)]]
  * Python libraries
    * [[http://code.google.com/p/couchdb-python/|CouchDB Python Library]]
    * [[http://couchdbkit.org/|Couchdbkit, a CouchDB framework for Python applications]]
    * [[https://launchpad.net/paisley/|Paisley: A Twisted Python CouchDB Client]]
  * Common Lisp libraries
    * [[http://common-lisp.net/project/clouchdb/|CouchDB Common Lisp Library]]
  * Clojure libraries
    * [[http://github.com/kunley/clojure-couchdb|clojure-couchdb]]
    * [[http://github.com/tashafa/clutch/|clutch]]
  * [[http://www.squeaksource.com/CouchDB.html|Squeak CouchDB Library]]
  * [[Storing_GeoData]] (PHP, Google Geocoding Service)

== Alternative Data Stores ==

  * [[http://www.mongodb.org|MongoDB (Is a high-performance, open source, schema-free document-oriented  database.)]]
  * [[http://riak.basho.com/|Riak (Is a Dynamo-inspired key/value store that scales predictably and easily.)]]
  * [[http://cassandra.apache.org/|Cassandra (Is a highly scalable, eventually consistent, distributed, structured key-value store.)]]
  * [[http://project-voldemort.com/|Voldemort (Is a distributed key-value storage system.)]]
  * [[http://http://code.google.com/p/redis/|Redis (Is a persistent key-value database with built-in net interface written in ANSI-C for Posix systems)]]
  * [[http://github.com/mbreese/featherdb|Feather DB (CouchDB clone in Java.  Note:This project is not active.)]]
  * [[http://github.com/yrashk/strokedb|StrokeDB (A CouchDB-like database written in Ruby to make embedding into Ruby apps easier.  Note:This project is not active.)]]

== Applications ==
  * See [[CouchDB_in_the_wild]]

== Miscellaneous ==

  * [[http://github.com/janl/couchdbx-core|couchdbx-core]] Packaging CouchDB for Mac OS X.
  * [[http://labs.mudynamics.com/wp-content/uploads/2009/04/icouch.html|Interactive CouchDB]] A CouchDB emulator/visualizer written in 100% Javascript.
  * [[http://tilgovi.github.com/couchdb-lounge/|Lounge]] A proxy-based partitioning/clustering framework for CouchDB.
  * [[http://github.com/jchris/hovercraft/tree/master|Hovercraft]] An easy direct Erlang CouchDB library.
  * [[http://vmx.cx/cgi-bin/blog/index.cgi/geocouch-the-future-is-now%3A2010-05-03%3Aen%2CCouchDB%2CPython%2CErlang%2Cgeo|GeoCouch]] Can be used for "Geodata" related applications.

== Full Text Searching ==

  * [[http://github.com/rnewson/couchdb-lucene|CouchDB Lucene]] Enables full-text searching of CouchDB documents using Lucene.
  * !HyperCouch : Full text indexing of CouchDB via Hyper Estraier
    * Note: ''HyperCouch was a project by Paul Davis, but it was abandoned''
    * http://www.davispj.com/2009/01/24/hypercouch.html
    * Code mirror [[http://github.com/benoitc/hypercouch|HyperCouch]]
  * [[http://github.com/deguzman/couchdb-solr2|CouchDB Solr2]] Integrates full-text indexing and searching with CouchDB.
    * Per README, the CouchDB Solr2 project is no longer being maintained as of January 2009.
