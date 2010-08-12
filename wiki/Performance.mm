<<TableOfContents>>

With up to tens of thousands of documents you will generally find CouchDB to perform well no matter how you write your code.  Once you start getting into the millions of documents you need to be a lot more careful.

Many of the individual wiki pages mention performance when describing how to do things.  It is worthwhile refreshing your memory by revisiting them.

= File size =
The smaller your file size, the less I/O operations there will be, the more of the file can be cached by CouchDB and the operating system, the quicker it is to replicate, backup etc.  Consequently you should carefully examine the data you are storing.  For example it would be silly to use keys that are hundreds of characters long, but your program would be hard to maintain if you only used single character keys.  Carefully consider data that is duplicated by putting it in views.

== _id ==
The db file size is derived from your document and view sizes but also on a multiple of your _id sizes.  Not only is the _id present in the document but it and parts of it are duplicated in the binary tree structure CouchDB uses to navigate the file to find the document in the first place. As a real world example for one user switching from 16 byte ids to 4 byte ids made a database go from 21GB to 4GB with 10 million documents (the raw JSON text when from 2.5GB to 2GB).

Inserting with sequential (and at least sorted) ids is faster than random ids.  Consequently you should consider generating ids yourself, allocating them sequentially and using an encoding scheme that consumes fewer bytes.  For example something that takes 16 hex digits to represent can be done in 4 base 62 digits (10 numerals, 26 lower case, 26 upper case).

= Network =
There is latency overhead making and receiving each request/response.  In general you should do your requests in batches.  Most APIs have some mechanism to do batches, usually by supplying lists of documents or keys in the request body.  Be careful what size you pick for the batches.  The larger the batch the more time your client has to spend encoding the items into JSON and more time is spent decoding that number of responses.   Do some benchmarking with your own configuration and typical data to find the sweet spot.  It is likely to be between one and ten thousand documents.

If you have a fast I/O system then you can also use concurrency - have multiple requests/responses at the same time.  This mitigates the latency involved in assembling JSON, doing the networking and decoding JSON.

= View generation =
Views with the Javascript view server (default) are extremely slow to generate when there are a non-trivial number of documents to process.  The generation process won't even saturate a single CPU let alone your I/O.  The cause is the latency involved in the CouchDB server and seperate couchjs view server, drammatically indicating how important it is to take latency out of your implementation.

You can let view access be "stale" but it isn't practical to determine when that will occur giving you a quick response and when views will be updated which will take a long time.  (A 10 million document database took about 10 minutes to load into CouchDB but about 4 hours to do view generation.)

View information isn't replicated - it is rebuilt on each database so you can't do the view generation on a separate sever.  The only useful mechanism I have found is to generate the view on a separate machine together with data updates, shut down your target server, copy the couchdb raw database file across and then restart the target server.

== Erlang implementations of common JavaScript functions ==

If you’re using a very simple view function that only performs a sum or count reduction, you can call native Erlang implementations of them by simply writing "_sum" or "_count" in place of your function declaration. This will speed up things dramatically, as it cuts down on IO between CouchDB and serverside JavaScript. For example, as [http://mail-archives.apache.org/mod_mbox/couchdb-user/201003.mbox/%3c5E07E00E-3D69-4A8C-ADA3-1B20CF0BA4C8@julianstahnke.com%3e mentioned on the mailing list], the time for outputting an (already indexed and cached) view with about 78,000 items went down from 60 seconds to 4 seconds.

Example:

Before:

 {{{#!javascript
{
    "_id": "_design/foo",
    "views": {
        "bar": {
            "map": "function (doc) { emit(doc.author, 1); }",
            "reduce": "function (keys, values, rereduce) { return sum(values); }"
        }
    }
}
}}}

After:

 {{{#!javascript
{
    "_id": "_design/foo",
    "views": {
        "bar": {
            "map": "function (doc) { emit(doc.author, 1); }",
            "reduce": "_sum"
        }
    }
}
}}}

This does not seem to be very well documented. In the [http://svn.apache.org/viewvc?view=revision&revision=774101 commit message], it is mentioned that users can supply more built-in functions.

= Programming language =
== Python ==
Python 2.6 and above ship with a JSON module based on simplejson.  It excludes simplejson's C based speedups and is an order of magnitude slower as a result.  You should install simplejson with the speedups and use that.  JSON encoding and decoding does not release the GIL which means that if you try to use threads to get concurrency - eg multiple network connections - then you won't actually get much concurrency.  Use the multiple processing module to get actual concurrency. Make sure each process/thread has its own database connection (ie underlying socket).

As an example one of my benchmarks turned out to be mostly limited by the json module's encoding and decoding speed.  The process was using 40% of a CPU.  Switching to simplejson with no other changes resulted in 5% of a CPU.  Switching from threads to processes (using multiprocessing module) gave yet another performance improvement finally pushing CouchDB to consume more than 100% of a CPU (this is on a multi-processor machine).

= Resource Limits =
One of the problems that administrators run into as their deployments become large are resource limits imposed by the system and by the application configuration. Raising these limits can allow your deployment to grow beyond what the default configuration will support.
== CouchDB Configuration Options ==
In your configuration (local.ini or similar) familiarize yourself with the following options:{{{
[couchdb]
max_dbs_open = 100

[httpd]
max_connections = 2048}}}
The first option places an upper bound on the number of databases that can be open at one time. CouchDB reference counts database accesses internally and will close idle databases when it must. Sometimes it is necessary to keep more than the default open at once, such as in deployments where many databases will be continuously replicating.
The second option limits how many client connections the HTTP server will service at a time. Again, heavy replication scenarios are good candidates for increased {{{max_connections}}} since the replicator opens several connections to the source database.
== System Resource Limits ==
=== Erlang ===
Even if you've increased the maximum connections CouchDB will allow, the Erlang runtime system will not allow more than 1024 connections by default. Adding the following directive to {{{(prefix)/etc/default/couchdb}}} (or equivalent) will increase this limit (in this case to 4096):{{{
export ERL_MAX_PORTS=4096}}}
=== PAM and ulimit ===
Finally, most *nix operating systems impose various resource limits on every process. If your system is set up to use the Pluggable Authentication Modules (PAM) system, increasing this limit is straightforward. For example, creating a file named {{{/etc/security/limits.d/100-couchdb.conf}}} with the following contents will ensure that CouchDB can open enough file descriptors to service your increased maximum open databases and Erlang ports:{{{
#<domain>    <type>    <item>    <value>
couchdb      hard      nofile    4096
couchdb      soft      nofile    4096}}}
If your system does not use PAM, a {{{ulimit}}} command is usually available for use in a custom script to launch CouchDB with increased resource limits.
If necessary, feel free to increase this limits as long as your hardware can handle the load.

= Disk and File System Performance =
Using faster disks, striped RAID arrays and modern file systems can all speed up your CouchDB deployment. However, there is one option that can increase the responsiveness of your CouchDB server when disk performance is a bottleneck. From the erlang documentation for the file module: {{{
On operating systems with thread support, it is possible to let file operations be performed in threads of their own, allowing other Erlang processes to continue executing in parallel with the file operations. See the command line flag +A in erl(1).}}}
Setting this argument to a number greater than zero can keep your CouchDB installation responsive even during periods of heavy disk utilization. The easiest way to set this option is through the {{{ERL_FLAGS}}} environment variable. For example, to give Erlang four threads with which to perform i/o operations add the following to {{{(prefix)/etc/defaults/couchdb}}} (or equivalent): {{{
export ERL_FLAGS="+A 4"}}}
