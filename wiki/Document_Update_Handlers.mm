## page was renamed from Document Update Handlers
## page was renamed from How_to_intercept_document_updates_and_perform_additional_server-side_processing
= Document Update Handlers =
<<TableOfContents()>>

== Basics ==

CouchDB (0.10 and up) has the ability to allow server-side updating of a document without the usual GET-modify-POST cycle, or server-side creation of a new document based on parameters sent by the user. This feature allows a range of use cases such as providing a server-side last modified timestamp, updating individual fields in a document without first getting the latest revision, etc.

It's important to note that and update handler doesn't need to have an entire document sent to it, as it will be passed the server's current version of the requested document. In fact, any parameters passed to an update function, other than the document ID, have to be handled manually by the update function itself.

== Implementation ==

This functionality is implemented via document update handlers defined in a design doc. Specifically, in a design doc one defines an "updates" attribute that contains any number of document update handlers. The follow handlers should be self-explanatory as to what they accomplish. 

{{{#!highlight javascript
{
  updates: {

    "hello" : function(doc, req) {
      if (!doc) {
        if (req.docId) {
          return [{
            _id : req.docId
          }, "New World"]
        }
        return [null, "Empty World"];          
      }
      doc.world = "hello";
      doc.edited_by = req.userCtx;
      return [doc, "hello doc"];
    },

    "in-place" : function(doc, req) {
      var field = req.form.field;
      var value = req.form.value;
      var message = "set "+field+" to "+value;
      doc[field] = value;
      return [doc, message];
    },

    "bump-counter" : function(doc, req) {
      if (!doc.counter) doc.counter = 0;
      doc.counter += 1;
      var message = "<h1>bumped it!</h1>";
      return [doc, message];
    },

    "error" : function(doc, req) {
      superFail.badCrash;
    },

    "xml" : function(doc, req) {
      var xml = new XML('<xml></xml>');
      xml.title = doc.title;
      var posted_xml = new XML(req.body);
      doc.via_xml = posted_xml.foo.toString();
      var resp =  {
        "headers" : {
          "Content-Type" : "application/xml"
        },
        "body" : xml
      };
     
       return [doc, resp];
     }
  }
}
}}}

NOTE: '''The functions should be quoted'''.

The handler function takes the document and the http request as parameters. It returns a two-element array: the first element is the (updated) document, which is committed to the database. The second element is the response that will be sent back to the caller.

== Usage ==

To invoke a handler, one must "PUT" the document against the handler function itself (POST does not seem to be supported). Using the canonical document URL won't invoke any handlers.

For example, to invoke the "in-place" handler defined above, the URL to use is:

{{{
http://127.0.0.1:5984/<my_database>/_design/<my_designdoc>/_update/in-place/<mydocId>?field=title&value=test
}}}

This means that unlike document validators, the user's intent must be clear by calling this individual handler explicitly. In this sense, you should think about an ''_update'' handler as complementary to ''_show'' functions, not to ''validate_doc_update'' functions.

== TBD ==

 * Is POST supported, or only PUT?
   * Maybe we should support PATCH?
 * Must fields be sent as URL query parameters, or can they be sent in the request representation?
