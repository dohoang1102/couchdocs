#redirect Getting_started_with_Java
Getting started with Java and the CouchDB API.

CouchDB4J is an updated Java library for CouchDB. It handles the REST style calls to the CouchDB server behind the scenes, and give you a handle on the JSON objects directly. CouchDB4J uses JSON-lib to handle mapping to/from JSON objects, which makes getting/setting properties on the objects very easy. You can even map Java objects to JSON objects and back to make the process easier.

With CouchDB4J, you create a Session object that handles the CouchDB server communication. From here, you can get a handle on your Database. From the ''Database'' you can run views or retrieve ''Documents''. A ''!ViewResult'' is a special type of ''Document'' which contains the id's of the ''Documents'' that matched your view function.

== Dependencies ==

  * http://code.google.com/p/couchdb4j
  * [[http://commons.apache.org/|Apache commons]]
    * commons-httpclient
    * commons-beanutils
    * commons-codec
    * commons-collections
    * commons-lang
    * commons-logging
  * [[http://json-lib.sf.net/|JSON-lib]]
    * json-lib-2.0
    * ezmorph

== Sample Usage ==

{{{
Session s = new Session("localhost",5984);
Database db = s.getDatabase("foodb");

Document doc = db.getDocument("documentid1234");
doc.put("foo","bar");
db.save(doc);

Document newdoc = new Document();
doc.put("foo","baz"); // same as JSON: { foo: "baz"; }
db.save(doc); // auto-generated id given by the database

// Running a view
ViewResult result = db.getAllDocuments(); // same as db.view("_all_dbs");
for (Document d: result.getResults()) {
        System.out.println(d.getId());

        /*
                ViewResults may not actually contain the full document, only what the view
                returned.  So, in order to get the full document, you need to request a
                new copy from the database.
        */

        Document full = db.getDocument(d.getId());
}

// Ad-Hoc view
ViewResult resultAdHoc = db.adhoc("function (doc) { if (doc.foo=='bar') { return doc; }}");
}}}

== Older Libraries ==

Older CouchDB Java library (doesn't support newer JSON syntax):

  http://code.google.com/p/couchdb-lib/
