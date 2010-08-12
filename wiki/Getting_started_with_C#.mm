There are three known public C# libraries for using CouchDB:
 1. [[http://github.com/arobson/Relax|Relax]]
 2. [[http://github.com/foretagsplatsen/Divan|Divan]]
 3. [[http://code.google.com/p/couchbrowse|SharpCouch]]

== Relax ==
The Relax library (http://github.com/arobson/Relax) provides interfaces for both server control (administrative tasks, replication, etc.) and a repository model for working with CouchDB. As the author of Relax, I can say that you should definitely take a look at Relax as it provides an extensible, IoC friendly, repository pattern for working with domain model persistence against my favorite document store.

* Features
  * Convention based mapping for saving POCOs
  * Base document types or interfaces for more control
  * Support for caching (Symbiote integration will provide memcached support)
  * Attachment support
  * Bulk-document API
  * Views
  * Real-time database change stream

Documentation is currently found at the Symbiote wiki: http://www.sharplearningcurve.com/wiki/Symbiote-Relax.ashx. There is also a comprehensive demo that's part of the source on github which shows some of Relax's more interesting capabilities, such as the ability to subscribe to changes in a database as they happen.

{{{
git clone git://github.com/arobson/Relax.git
}}}

Relax does not currently provide Lucene support. Congrats to Henrik for supporting that in Divan!

== Divan ==
The git repository at http://github.com/foretagsplatsen/Divan has a relatively complete C# library for CouchDB using Newtonsoft.JSON and NUnit as its only external dependencies. Divan is actively maintained and in use at Foretagsplatsen (a swedish company using it in their core system). Being the author of Divan I claim it to be much more complete than !SharpCouch :)

For more information see the [[http://github.com/foretagsplatsen/Divan|README]]. 
{{{
git clone git://github.com/foretagsplatsen/Divan.git
}}}

== SharpCouch ==
The project at http://code.google.com/p/couchbrowse contains a simple wrapper library for CouchDB, called !SharpCouch, and a GUI client which makes use of the library. The GUI client code should serve as a good usage example, although the wrapper class is documented and fairly self-explanatory anyway.

You can get the source by issuing the following SVN command:

{{{
svn checkout http://couchbrowse.googlecode.com/svn/trunk/ couchbrowse
}}}

The project was built with !SharpDevelop 2.2, but should work out of the box with Visual Studio 2005. Getting it to work with !MonoDevelop should be reasonably easy, but has not been tried yet.
