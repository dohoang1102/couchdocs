#redirect Frequently_asked_questions
## page was renamed from FAQ
## page was renamed from Faq
A handy FAQ for all your CouchDB related questions.

  * [[#what_is_couchdb|What is CouchDB?]]
  * [[#is_couchdb_ready_for_production|Is CouchDB Ready for Production?]]
  * [[#what_does_couch_mean|What Does Couch Mean?]]
  * [[#what_language|What Language is CouchDB Written in?]]
  * [[#what_platform|What Platforms are Supported?]]
  * [[#what_license|What is the License?]]
  * [[#how_much_stuff|How Much Stuff can I Store in CouchDB?]]
  * [[#how_sequences|How Do I Do Sequences?]]
  * [[#how_replication|How Do I Use Replication?]]
  * [[#how_spread_load|How can I spread load across multiple nodes?]]
  * [[#how_fast_views|How Fast are CouchDB Views?]]
  * [[#why_no_mnesia|Why Does CouchDB Not Use Mnesia?]]
  * [[#i_can_has_no_http|Can I talk to CouchDB without going through the HTTP API?]]
  * [[#update_views_more_often|I want to update my view indexes more often than only when a user reads it. How do I do that best?]]
  * [[#secure_remote_server|I use CouchDB on a remote server and I don't want it to listen on a public port for security reasons. Is there a way to connect to it from my local machine or can I still use Futon with it?]]
  * [[#slow_view_building|Creating my view index takes ages, WTF?]]

If you have a question not yet answered in this FAQ please hit the edit button and add your question at the end. Check back in a few days, someone may have provided an answer.

<<Anchor(what_is_couchdb)>>
== What is CouchDB? ==

CouchDB is a document-oriented, Non-Relational Database Management Server (NRDBMS). The [[http://incubator.apache.org/couchdb/docs/intro.html|Introduction]] and [[http://incubator.apache.org/couchdb/docs/overview.html|Overview]] provide a high level overview of the CouchDB system.

<<Anchor(is_couchdb_ready_for_production)>>
== Is CouchDB Ready for Production? ==

Alpha Release. CouchDB has not yet reached version 1.0. There will likely be data-storage format changes and incompatible HTTP API changes between now and 1.0. However, there are projects successful using CouchDB in a variety of contexts. See InTheWild for a partial list of projects using CouchDB.

<<Anchor(what_does_couch_mean)>>
== What Does Couch Mean? ==

It's an acronym, Cluster Of Unreliable Commodity Hardware. This is a statement of Couch's long term goals of massive scalablility and high reliability on fault-prone hardware. The distributed nature and flat address space of the database will enable node partitioning for storage scalabilty (with a map/reduce style query facility) and clustering for reliability and fault tolerance.

<<Anchor(what_language)>>
== What Language is CouchDB Written in? ==

Erlang, a concurrent, functional programming language with an emphasis on fault tolerance. Early work on CouchDB was started in C but was replaced by Erlang OTP platform. Erlang has so far proven an excellent match for this project.

CouchDB's default view server uses Mozilla's Spidermonkey Javscript library which is written in C. It also supports easy integration of view servers written in any language.

<<Anchor(what_platform)>>
== What Platforms are Supported? ==

Most POSIX systems, this includes GNU/Linux and OS X.

Windows is not officially supported but it should work, please let us know.

<<Anchor(what_license)>>
== What is the License? ==

[[http://www.apache.org/licenses/LICENSE-2.0.html|Apache 2.0]]

<<Anchor(how_much_stuff)>>
== How Much Stuff can I Store in CouchDB? ==

With node partitioning, virtually unlimited. For a single database instance, the practical scaling limits aren't yet known.

<<Anchor(how_sequences)>>
== How Do I Do Sequences? ==

Or, where is my AUTO_INCREMENT?! With replication sequences are hard to realize. Sequences are often used to ensure unique identifiers for each row in a database table. CouchDB generates unique ids from its own and you can specify your own as well, so you don't really need a sequence here. If you use a sequence for something else, you might find a way to express in CouchDB in another way.

<<Anchor(how_replication)>>
== How Do I Use Replication? ==

{{{
POST /_replicate?source=$source_database&target=$target_database
}}}

Where $source_database and $target_database can be the names of local database or full URIs of remote databases. Both databases need to be created before they can be replicated from or to.

<<Anchor(how_spread_load)>>
== How can I spread load across multiple nodes? ==

Using an http proxy like nginx, you can load balance GETs across nodes, and direct all POSTs, PUTs and DELETEs to a master node. CouchDB's triggered replication facility can keep multiple read-only servers in sync with a single master server, so by replicating from master -> slaves on a regular basis, you can keep your content up to date.

<<Anchor(how_fast_views)>>
== How Fast are CouchDB Views? ==

It would be quite hard to give out any numbers that make much sense. From the architecture point of view, a view on a table is much like a (multi-column) index on a table in an RDBMS that just performs a quick look-up. So this theoretically should be pretty quick.

The major advantage of the architecture is, however, that it is designed for high traffic. No locking occurs is the storage module (MVCC and all that) allowing any number of parallel readers as well as serialized writes. With replication, you can even set up multiple machines for a horizontal scale-out and data partitioning (in the future) will let you cope with huge volumes of data. (See [[http://jan.prima.de/~jan/plok/archives/72-Some-Context.html|slide 13 of Jan Lehnardt's essay]] for more on the storage module or the whole post for detailed info in general).

<<Anchor(why_no_mnesia)>>
== Why Does CouchDB Not Use Mnesia? ==

Several reasons:

  * The first is a storage limitation of 2 gig per file.
  * The second is that it requires a validation and fixup cycle after a crash or power failure, so even if the size limitation is lifted, the fixup time on large files is prohibitive.
  * Mnesia replication is suitable for clustering, but not disconnected, distributed edits. Most of the "cool" features of Mnesia aren't really useful for CouchDB.
  * Also Mnesia isn't really a general-purpose, large scale database. It works best as a configuration type database, the type where the data isn't central to the function of the application, but is necessary for the normal operation of it. Think things like network routers, HTTP proxies and LDAP directories, things that need to be updated, configured and reconfigured often, but that configuration data is rarely very large.

<<Anchor(i_can_has_no_http)>>
== Can I talk to CouchDB without going through the HTTP API? ==

CouchDB's data model and internal API map the REST/HTTP model so well that any other API would basically reinvent some flavour of HTTP. However, there is a plan to refactor CouchDB's internals so as to provide a documented Erlang API.

<<Anchor(update_views_more_often)>>
== I want to update my view indexes more often than only when a user reads it. How do I do that best? ==

To get on write view update semantics, you can create a little daemon
script to run alongside CouchDB and specified in couch.ini
as DbUpdateNotificationProcesses. This deamon gets sent a 
notification each time the database is changed and could in turn
trigger a view update every N document inserts or every Y seconds,
whichever occurs first. The reason not to integrate each doc as
it comes in is that it is horribly inefficient and CouchDB is designed
to do view index updates very fast, so batching is a good idea.
See RegeneratingViewsOnUpdate for an example.

To get a list of all views in a database, you can do a 
GET /db/_all_docs?startkey=_design/&endkey=_design/ZZZZ
(we will have a /db/_all_design_docs view to make the ZZZZ-hack
go away).

That should solve your problem.

Yes, such a daemon should be shipped with CouchDB, but we
haven't got around to work on the deployment infrastructure yet.
Any contributions to this are very welcome. I think the developer's
choice of language for helper scripts is Python, but any will do,
whatever suits you best.

<<Anchor(secure_remote_server)>>
== I use CouchDB on a remote server and I don't want it to listen on a public port for security reasons. Is there a way to connect to it from my local machine or can I still use Futon with it? ==

On you local machine, set up an ssh tunnel to your server and 
tell it to forward requests to the local port 5984 to the remote
server's port 5984:

{{{
$ ssh -L5984:127.0.0.1:5984 ssh.example.com
}}}

Now you can connect to the remote CouchDB through
http://localhost:5984/

<<Anchor(slow_view_building)>>
== Creating my view index takes ages, WTF? ==

A couple of reasons:

1) If you have a lot of documents or lots of large documents (going into the millions and Gigabytes of data, the first time a view index is created just takes the time it is needed to run through all documents.

2) If you use the `emit()`-function in your view with `doc` as the second parameter you effectively copy your entire data into the view index. This takes a lot of time. Consider rewriting your `emit()` call to `emit(key, null);` and query the view with the `?include_docs=true` parameter to get all doc's data with the view without having to copy the data into the view index.

3) You are using Erlang release R11B (or 5.5.x). Update to at least R12B-3 (or 5.6.3).
