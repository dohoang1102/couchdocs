#redirect Installing_on_Windows
<<TableOfContents>>

CouchDB does not natively install on Windows but it is possible to install it by hand. '''Be aware that many unit tests fail due to IO-related features that aren't supported by Erlang on Windows.'''

Please update this guide as needed, we aim to collect feedback and roll the procedure into the official build.

These instructions currently refer to paths as they'd be set up in a default installation of Erlang OTP 5.6.3, with the couchDB distribution installed at

{{{
C:\Program Files\erl5.6.3\lib\couchdb-0.8.1
}}}

== Dependencies ==

You will need the following software installed on your system:

  * [[http://www.erlang.org/download.html|Erlang/OTP]]
  * C Compiler/Linker (such as [[http://gcc.gnu.org/|GCC]] or [[http://msdn.microsoft.com/en-us/visualc/default.aspx|Visual C++]])
  * Make (such as [[http://www.gnu.org/software/make/|GNU Make]] or [[http://msdn.microsoft.com/en-us/library/dd9y37ha(VS.71).aspx|nmake]])
  * [[http://www.openssl.org/|OpenSSL]]
  * [[http://www.icu-project.org/|ICU]] (Tested with [[http://www.icu-project.org/download/4.0.html|binary build of 4.0 release]].)
  * [[http://www.mozilla.org/js/spidermonkey/|SpiderMonkey]]

== Install CouchDB as an Erlang Library Directory ==

After installing Erlang you should having something similar to:

{{{
C:\Program Files\erl5.6.3
}}}

Copy the whole CouchDB source tree to:

{{{
C:\Program Files\erl5.6.3\lib\couchdb-0.8.1
}}}

Make the following empty directory:

{{{
C:\Program Files\erl5.6.3\lib\mochiweb-0.01\ebin
}}}

== Provide ICU to Erlang ==

From ICU copy `icu*.dll` (and `libeay32.dll` for older versions of ICU) to:

{{{
C:\Program Files\erl5.6.3\erts-5.6.3\bin
}}}

== Build SpiderMonkey ==

The SpiderMonkey distribution's Windows build stuff is broken. See [[http://blog.endflow.net/?p=55&lang=en|this blog post]] for a working js.mak file. Don't bother trying to import the project file into a contemporary Visual Studio; just use the Visual Studio command line tools with the js.mak file referred to above.

CouchDB uses a custom JavaScript driver, which provides unicode and buffering improvements. In the !SpiderMonkey distribution, rename src/js.c to src/js.c.bak, and copy {{{C:\Program Files\erl5.6.3\lib\couchdb-0.8.1\src\couchdb\couch_js.c}}} from the CouchDB distribution to src/js.c in the !SpiderMonkey distribution. Before running nmake, edit the new js.c and change {{{#include <jsapi.h>}}} to {{{#include "jsapi.h"}}}.

Once you've built js.exe and js32.dll, copy them both to

{{{
C:\Program Files\erl5.6.3\erts-5.6.3\bin
}}}

and rename js.exe to couch_js.exe.

== Build couchdb/couch_erl_driver.c ==

This is a wrapper to provide ICU features to CouchDB.

''Here is a binary (no warranty! may burn your eyes out!) built against ICU 4.0 in 32-bit Windows: [[attachment:couch_erl_driver.dll]]''

The simplest way to build a DLL is to create a Win32 DLL project in an IDE, add `couch_erl_driver.c` into the project, and change project settings to include the Erlang ERTS and ICU4C header paths. You must also include the various ICU `*.lib` files to the MSVC linker as inputs. MSVC doesn't know how to create a DLL with unresolved names.

Make the following empty directory:

{{{
C:\Program Files\erl5.6.3\lib\couchdb-0.8.1\priv
}}}

Copy the DLL to:

{{{
C:\Program Files\erl5.6.3\lib\couchdb-0.8.1\priv\couch_erl_driver.dll
}}}

== Erlang Compilation ==

Create a the following file:

{{{
C:\Program Files\erl5.6.3\lib\couchdb-0.8.1\src\Emakefile
}}}

Add the following content:

{{{
{'./couchdb/*', [{outdir,"../ebin"}]}.
{'./mochiweb/*', [{outdir,"../../mochiweb-0.01/ebin"}]}.
}}}

Launch `erl` (or `werl`) and execute the following command to change working directory:

{{{
cd("C:/Program Files/erl5.6.3/lib/couchdb-0.8.1/src").
}}}

Execute this command to compile CouchDB:

{{{
make:all().
}}}

== Configuring ==

Copy the following file:

{{{
C:\Program Files\erl5.6.3\lib\couchdb-0.8.1\etc\couchdb\couch.ini.tpl.in
}}}

To this location:

{{{
C:/Program Files/erl5.6.3/bin/couch.ini
}}}

or to this location:

{{{
C:/Program Files/erl5.6.3/lib/couchdb-0.8.1/couch.ini
}}}

Edit the file to look something like this:

{{{
[Couch]

ConsoleStartupMsg=Apache CouchDB is starting.

DbRootDir=C:/Path/To/Database/Directory

Port=5984

BindAddress=127.0.0.1

DocumentRoot=C:/Program Files/erl5.6.3/lib/couchdb-0.8.1/share/www

LogFile=C:/Path/To/Log/Directory

UtilDriverDir=C:/Program Files/erl5.6.3/lib/couchdb-0.8.1/priv/

LogLevel=info

[Couch Query Servers]

javascript=couch_js "C:/Program Files/erl5.6.3/lib/couchdb-0.8.1/share/server/main.js"
}}}

Make sure that the `DbRootDir` exists and that the `LogFile` can be created.

== Running ==

Launch `erl` (or `werl`) and execute the following command:

{{{
couch_server:start().
}}}

To check that everything has worked point your web browser to
[[http://localhost:5984/_utils/index.html]] and run the test suite.
