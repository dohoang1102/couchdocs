#redirect Configurationfile_couch.ini
The default location of the couch.ini file is in /usr/local/etc/couch.  It is the local configuration file for the couch server.

The default configuration file is shown, with each option described in detail.

{{{
; etc/couchdb/couch.ini.tpl.  Generated from couch.ini.tpl.in by configure.
[Couch]
ConsoleStartupMsg=Apache CouchDB is starting.
DbRootDir=/usr/local/var/lib/couchdb
Port=5984
BindAddress=192.168.109.162
DocumentRoot=/usr/local/share/couchdb/www
LogFile=/usr/local/var/log/couchdb/couch.log
UtilDriverDir=/usr/local/lib/couchdb/erlang/lib/couch-0.8.0-incubating/priv/lib
LogLevel=info
[Couch Query Servers]
javascript=/usr/local/bin/couchjs /usr/local/share/couchdb/server/main.js
}}}

=== Couch section ===
 * {{{ConsoleStartupMsg}}}
 * {{{DbRootDir}}}
 * {{{Port}}}
 * {{{BindAddress}}} - you probably need to change this to your outward facing network interface.
 * {{{DocumentRoot}}}
 * {{{LogFile}}}
 * {{{UtilDriverDir}}}
 * {{{LogLevel}}} - values 'info', 'debug'

=== Couch Query Servers section ===
 * {{{javascript}}}
