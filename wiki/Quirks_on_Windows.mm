= Quirks on Windows =
Using CouchDB does not require installing cygwin, or becoming a command-line guru. If you get stuck here your best bet is [[irc://irc.freenode.net/couchdb|IRC on #couchdb]] or the mailing list. This page will help you relax on Windows just as much as anywhere else!

== Quick Start ==
So you just can't wait to relax can you? The fastest route is to:

 * unzip [[http://curl.haxx.se/download/curl-7.19.5-win32-ssl-sspi.zip|curl]] and add to your path
 * install the corresponding [[http://www.slproweb.com/download/Win32OpenSSL-1_0_0a.exe|win32 OpenSSL]] binaries to your system path
 * run the latest [[http://github.com/couchapp/couchapp/downloads|couchapp installer]]
 * sign yourself up for the current free no-guarantees [[http://www.couch.io/get|beta cloud hosting]] to get your own couch ready to go
 * read the [[http://github.com/couchapp/couchapp/blob/master/README.md|quick start notes]] on using [[http://www.couchapp.org/|CouchApp]]
 * wade into [[http://books.couchdb.org/relax/|the Definitive Guide]]


== Run ==
 * You can still complete compaction of your couch by stopping CouchDB and deleting/renaming the appropriate data files - just be careful
 * the crash-safe storage engine means you can hibernate or reboot at will without data loss
 * VSS snapshots for backup are a really good way to go
 * Firefox is the only supported browser for the test suite, but for almost anything else a current version of IE will work "just fine". YMMV
 * you can restart the CouchDB service via commandline, the Services control panel, or build yourself a shortcut or .cmd file to do the trick also:

{{{
net.exe stop "Apache CouchDB" && net.exe start "Apache CouchDB"
}}}
 * cURL works just fine on Windows -- once you understand the unwritten rules of quotes which are very different to that on Unix. The standard example from CouchDB the Definitive Guide will fail with a "Invalid UTF-8 JSON" error

{{{
curl-X PUT http://username:password@localhost:5984/albums/6e1295ed6c29495e54cc05947f18c8af -d '{"title":"There is Nothing Left to Lose","artist":"Foo Fighters"}'
}}}
 * the 2 alternatives are either to include your JSON-encoded data as a file:

{{{
 curl-X PUT http://username:password@localhost:5984/albums/6e1295ed6c29495e54cc05947f18c8af -d @foo.json
}}}
 * or to use one of the three escape character sequences ("" or a ^" or a \") for every internal quote, to get past the cmd.exe shell

{{{
curl -X PUT http://username:password@localhost:5984/albums/6e1295ed6c29495e54cc05947f18c8af -d "{\"title\":\"There is Nothing Left to Lose\",\"artist\":\"Foo Fighters\"}"
}}}

== Tools ==
 * For general usage of CouchDB and the essential [[http://www.couchapp.org|CouchApp]] tool, get the following bits installed & added to your path
 * in each case we list the tool, site, then the version last tested with in case you get stuck with version creep
 * the 32-bit tools are recommended even on 64-bit platforms for the moment.
 * you'll only need one of the CouchDB versions below -


||Tool || WWW || Tested Version ||
|| cURL || http://curl.haxx.se/dlwiz/?type=bin&os=Win32 || http://curl.haxx.se/download/curl-7.19.5-win32-ssl-sspi.zip ||
|| Python 2.6.5 || http://python.org/ || http://python.org/ftp/python/2.6.5/python-2.6.5.msi ||
|| !PyWin32 || http://sourceforge.net/projects/pywin32/ || http://sourceforge.net/projects/pywin32/files/pywin32/Build%20214/pywin32-214.zip/download ||
|| !Py2Exe || http://www.py2exe.org/ || http://sourceforge.net/projects/py2exe/files/py2exe/0.6.9/py2exe-0.6.9.zip/download ||
|| OpenSSL || http://www.slproweb.com/products/Win32OpenSSL.html || http://www.slproweb.com/download/Win32OpenSSL-1_0_0a.exe ||
|| CouchDB v0.11.0 on Erlang 13B04 || http://people.apache.org/~mhammond/dist/ || http://people.apache.org/~mhammond/dist/0.11.0/setup-couchdb-0.11.0.exe ||
|| CouchDB v1.0.0 on Erlang 14A || http://couch.io/downloads || http://dl.couchone.com/dl/2550c382c3e01df830a3525ed6000b7d/couchdb_1.00%2BerlangR14A.zip ||

== Building from Source  ==
Note the full build chain is documented in http://github.com/apache/couchdb/blob/trunk/INSTALL.Windows -- but again you don't need this for *installing* and *using* CouchDB on Windows.
 * use only 32-bit components even if you are building on a 64-bit architecture
 * make sure you have a clean path with your build chain first - watch out for other developer tools like git, which may have older versions of OpenSSL or ICU binaries in your path
 * Firefox is the only supported browser for running the Futon test suite - some tests still fail due to platform differences however

== Upgrade ==
 * recommendation is to backup, uninstall, re-install, validate using Futon test suite, restore data, rather than an in-place upgrade
 * this ensures you have a cruft-free experience while the windows build & installer continues to change

== Tricks and Traps ==
 * Online compaction is not supported on Windows due to differences between UX and Windows on renaming/deleting files that are open in another process/thread
 * if your installed CouchApp.exe doesn't start correctly, you may want to remove two DLLs from it's folder - KernelBase.DLL and PowrProf.DLL which were present in CouchApp.0.6.exe and should be removed.
 * Not much else really since 0.10 if you have any problems feel free to post to the list for advice.
