All info about CouchCamp is accessible here:

http://www.couch.io/couchcamp

A few speakers have been invited to speak but the majority of the time will be "unconference" style group participation and discussion.

= Unconference Whiteboard =

this space is in intended to serve as a space to flush out ideas for group discussions. people should feel free to add comments and questions to any section.

=== CouchDB on mobile ===

What phones/devices are/can be targeted?
Alternate implementations or ports of the current Apache (erlang) CouchDB?

=== HTML5 CouchDB ===

IndexedDatabase and IDBCouch.
WebStorage.

=== CouchDB and the web security model ===

What do we need to do to allow CouchApps to play in the web sandbox. Eg if I'm running a banking CouchApp and a chat CouchApp, and the chat CouchApp has a bug that allows the person you are chatting with to inject HTML/JS into your browser, how do we keep that from being a vector for attack on your banking data?

=== Ideas and priorities for CouchDB 2.0 ===

Now that we're releasing 1.0, it's time to think about what the next 5 years of CouchDB development will bring. Alternate indexers? Binary attachment storage options? Refactoring to use web-machine? Of course, real decisions will be made on the dev@ list, but there's nothing like a campfire and some beers to get the ideas flowing.

   * Replaceable storage (e.g., use ets for transient database documents)

   * Realtime interactions with live db or filtered replica
      * Filtered replication to diskless copy (data discovery via filtering)
      * Browsing JSON document structure to discern data patterns (auto-documentation)
      * Statistics of db contents (interactive mapreduce)
      * Sandbox of real document subset
        * iterative code development
        * testing
        * error reproduction

   * A model of error handling with the goal of conveying information to the user

   * Command-line JSON-aware tools tuned to Couch interfaces

=== GeoCouch and why it rules ===

Once you add some location information to your documents, you can ask your GeoCouch to give you a list of documents that are located in an area. Let's talk about how to integrate geo data into your applications, and why bringing CouchDB to the GIS world is important.

=== How to contribute to CouchDB ===

Want to help with CouchDB, but need some hints on getting started? We'll give a tour of the codebase and show you how to find and fix bugs in the Erlang implementation. Also you can do a lot to help CouchDB, just by writing JavaScript, so we'll show you that too. Hopefully this will demystify the codebase, and you can start hacking on CouchDB.
