#redirect Full_text_search
== Fulltext Indexing and Searching ==
CouchDB comes with fulltext indexing support using [[http://lucene.apache.org|Apache Lucene]] as a reference implementation. The integration is modular and allows any fulltext search technology to be used in combination with CouchDB.

=== Index interface ===

CouchDB uses stdio for interfacing to the search engine,whenever a document is changed the name of the database 
containing the document is sent to stdout.

CouchDB does not expect to receive anything on stdin (read: it will crash if it does).

==== setup ====

The indexer is started by CouchDB using the command line specified in
the couch.ini configuration parameter:

{{{
DbUpdateNotificationProcess
}}}


=== Search interface ===

CouchDB again uses stdio to interface to the searcher part.

Currently this interface is not exposed through Futon, so to try it out you need to
start CouchDB with the 
interactive option -i to get an Erlang shell.

From there you can write search queries like:

{{{
couch_ft_query:execute("database", "+ query +string").
}}}


For this example the string "database\n" followed by "+ query +string\n" is
transmitted to stdout.

The result must follow this exact scheme to ensure that CouchDB understands
it. The first line must be "ok\n". The next two lines contain the id of the 
highest ranking document that matches the query and the score or rank: 
"docid1\n7\n". These two lines are repeated for all matching documents. 
The end of the result must be signaled with an empty newline "\n\n". 

In case of an error, the first line consists of "error\n" and the second
line of the error message: "Invalid Foo Condition\n".

==== setup ====
The searcher is started by CouchDB using the command line specified in
the couch.ini configuration parameter:

{{{
FullTextSearchQueryServer
}}}


=== Lucene reference implementation ===

==== RFC: Use of special design document ====
Please not that this is currently in discussion and not actually set in code.
A database to index must contain a special design document in this format:

{{{
{
  "_id":"_design/fulltextsearch",
  "_rev":"123",
  "fulltext_options": {
    "views": {
      "names" : {"index":"view-value", "return":"document"},
      "cities": {"index":"view-key", "return":"view"}
    }
  }
}
}}}

The Lucene indexer uses the defined views in this document to guide the indexing
process. 

In this example the views "names" and "cities" must also be defined in the database. 
Lucene will index the "view-value" for the "names" view and return documents as
search results, 
for the "cities" view it will index the view-key and return the view in search results.

For info on views in CouchDB see: [[Views]]


==== Dependencies ====
The Lucene indexer depends on these projects .jar files to work
 * couchdb4j.jar (see below)
   * commons-beanutils.jar
   * commons-codec-1.3.jar
   * commons-collections.jar
   * commons-httpclient-3.1.jar
   * commons-lang.jar
   * commons-logging-1.1.jar
   * ezmorph-1.0.3.jar
   * json-lib-2.0-jdk15.jar
 * lucene-core-2.3.1.jar

Note: all the couchdb4j dependencies (as you can see some have not
version info supplied) is probably easily checked out from the
couchdb4j repository (see below).

Note: at this time of writing couchdb4j needs to be patched using the patches
specified in issue 6 and 8 
on the coucdb4j issue tracking list: 

http://code.google.com/p/couchdb4j/issues/list

So checkout trunk patch and build.

At least Java version 5 is needed.

==== Compiling ====
The Lucene search engine is not build as part of the CouchDB. 

You need to:
 * setup a Java developer environment (at least version 5). 
 * Checkout CouchDB source.
 * Change directory to src/fulltext/lucene
 * Compile using javac with CLASSPATH with the needed dependencies (listed above)
 * Do: jar cf !CouchLucene.jar *.class 

As result you should get a file !CouchLucene.jar to include in your CLASSPATH at
runtime.

==== Runtime setup ====
You need a path to your java runtime (at least version 5).
You have to setup your java CLASSPATH to contain all the .jar files listed in the
dependency list,
alternatively you can specify it on the command line defined for the .ini options like:

{{{
FullTextSearchQueryServer=java -cp /path/to/couchdb4j/lib/couchdb4j.jar:...
LuceneSearcher
DbUpdateNotificationProcess=java -cp /path/to/couchdb4j/lib/couchdb4j.jar:...
LuceneIndexer
}}}

Note above example works on Unix like OS's
