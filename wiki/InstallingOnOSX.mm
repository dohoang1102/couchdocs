#redirect Installing_on_OSX
To install CouchDB using Mac``Ports

{{{
$ sudo port install couchdb +server
}}}

should be enough. Mac``Ports takes care of installing all necessary dependencies. If you have
already installed some of the CouchDB dependencies via Mac``Ports, run this command to check and
upgrade any outdated ones, ''after installing CouchDB'':

{{{
$ sudo port upgrade couchdb
}}}

This will upgrade dependencies recursively, if there are more recent versions available. If you want to
run CouchDB as a service controlled by the OS, load the launchd configuration which comes with the project,
with this command:

{{{
$ sudo launchctl load -w /opt/local/Library/LaunchDaemons/org.apache.couchdb.plist
}}}

and it should be up and accessible via http://127.0.0.1:5984/_utils/index.html. (Don't use the plist file
Mac``Ports mentions in terminal output, located at {{{/Library/LaunchDaemons/org.macports.CouchDB.plist}}}, it does not work.)

== Dependencies - Erlang ==
If you experience a Bus Error when compiling CouchDB on OSX 10.5, it's likely due to incompatibility between the Mac OS Leopard and Erlang HiPE. Luckily, fixing the problem is as simple as rebuilding Erlang with the most recent port file (while ''not'' selecting the hipe variant). Run:

{{{
$ sudo port selfupdate
}}}

to update the port tree, and then install just as explained. Here's [[http://trac.macports.org/ticket/15459|the bug report on the Mac Ports website.]]

If you have a previous install of Erlang you should run

{{{
$ port upgrade erlang
}}}

If Erlang fails to build with the error:
{{{
Command output: megaco_flex_scanner_drv.flex:31: unknown error processing section 1
}}}
You will need to upgrade flex: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=465039

== Typical build process of a CouchDB developer build ==

{{{
$ svn checkout http://svn.apache.org/repos/asf/incubator/couchdb/trunk couchdb
$ cd couchdb
$ ./bootstrap && ./configure
$ make
$ sudo make install
}}}

== Unofficial Binary Packages ==
If you just want to give CouchDB a shot and don't like the command line based installation, you can get this unofficial binary release for MacOS X 10.5 Leopard and Intel Macs only: http://jan.prima.de/~jan/plok/archives/142-CouchDBX-Revival.html
