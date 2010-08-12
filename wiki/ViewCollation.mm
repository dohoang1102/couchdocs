#redirect View_collation
A simple introduction to CouchDB view collation.

== Basics ==

View functions specify a key and a value to be returned for each row. CouchDB collates the view rows by this key. In the following example, the !LastName property serves as the key, thus the result will be sorted by !LastName:

{{{
function(doc) {
  if (doc.Type == "customer") {
    emit(doc.LastName, {FirstName: doc.FirstName, Address: doc.Address});
  }
}
}}}

CouchDB allows arbitrary JSON structures to be used as keys. You can use complex keys for fine-grained control over sorting and grouping.

== Examples ==

The following clever trick would return both customer and order documents. The key is composed of a customer ''_id'' and a sorting token. Because the key for order documents begins with the ''_id'' of a customer document, all the orders will be sorted by customer. Because the sorting token for customers is lower than the token for orders, the customer document will come before the associated orders. The values ''0'' and ''1'' for the sorting token are arbitrary.

{{{
function(doc) {
  if (doc.Type == "customer") {
    emit([doc._id, 0], doc);
  } else if (doc.Type == "order") {
    emit([doc.customer_id, 1], doc);
  }
}
}}}

This trick was [[http://www.cmlenz.net/blog/2007/10/couchdb-joins.html|originally documented]] by Christopher Lenz.

=== Sorting by Dates ===

It maybe be convenient to store date attributes in a human readable format (i.e. as a String), but still sort by date. This can be done by converting the date to a number in the emit function. For example, given a document with a created_at attribute of 'Wed Jul 23 16:29:21 +0100 2008', the following emit function would sort by date
{{{
emit(Date.parse(doc.created_at), doc);
}}}

Alternatively, if you use a date format which sorts lexicographically, such as "2008/06/09 13:52:11 +0000" you can just 
{{{
emit(doc.created_at, doc);
}}}
and avoid the conversion. As a bonus, this date format is compatible with the Javascript date parser, so you can use ''new Date(doc.created_at)'' in your client side Javascript to make date sorting easy in the browser.

=== String Ranges ===

If you need start and end keys that encompass every string with a given prefix, it is better to use a high value unicode character, than to use a 'ZZZZ' suffix.

Rather than:
{{{
startkey="_design/"&endkey="_design/ZZZZZZZZZ" 
}}}

You should use:
{{{
startkey="_design/"&endkey="_design/\u9999" 
}}}

== Collation Specification ==

This section is based on the ''view_collation'' function in ''couch_tests.js'':

{{{
// special values sort before all other types
null
false
true

// then numbers
1
2
3.0
4

// then text, case sensitive
"a"
"A"
"aa"
"b"
"B"
"ba"
"bb"

// then arrays. compared element by element until different.
// Longer arrays sort after their prefixes
["a"]
["b"]
["b","c"]
["b","c", "a"]
["b","d"]
["b","d", "e"]

// then object, compares each key value in the list until different.
// larger objects sort after their subset objects.
{a:1}
{a:2}
{b:1}
{b:2}
{b:2, a:1} // Member order does matter for collation.
           // CouchDB preserves member order
           // but doesn't require that clients will.
           // this test might fail if used with a js engine
           // that doesn't preserve order
{b:2, c:2}
}}}
