#format wiki
#language en
== Gagan Saksena ==
Some recipes/notes from using CouchDB. These could be valuable someday for others navigating their way in these waters. For now mostly a placeholder for things I'm learning. This is '''work in progress'''!

==== Handy shortcuts ====
There are a number of handy shortcuts for doing standard reduce tasks- Checkout [[Built-In_Reduce_Functions]] for more details.

=== SQL Recipes in Map/Reduce ===
A collection of handy recipes to do common tasks in map/reduce. This page is still in development- checkout this book's page for some useful details- [[http://books.couchdb.org/relax/reference/views-for-sql-jockeys|Views for SQL jockeys]]

For the purpose of these recipes- the equivalent SQL table looks like this-

{{{
CREATE TABLE Foo ( 
  Name CHAR(256),
  Age INTEGER,
  StartDate DATE
);
}}}
||<tablewidth="80%">'''SQL''' ||'''Map''' ||'''Reduce''' ||'''Notes''' ||
||SELECT COUNT(*) FROM Foo; ||function (doc) {  emit(doc._id, 1); } ||_count ||             ||
||SELECT COUNT(*) FROM Foo WHERE Foo.Age ="21"; ||function (doc) {  emit(doc.age, null); } ||_count ||Fetch view with ?key=21 ||
||SELECT DISTINCT Age FROM Foo; ||function (doc) {  emit(doc.age, true); } || function (key, value, rereduce) { // todo }   ||             ||
||GROUP BY example ||function (doc) {  // todo } ||             ||             ||
||GROUP BY with SORT BY example ||function (doc) {  // todo } ||             ||             ||


----
CategoryHomepage
