#redirect Error_messages
Explanation and solution of error messages you may experience while building or running CouchDB.

== Missing icu-config ==

=== Problem ===

{{{
*** The icu-config script could not be found. Make sure it is
*** in your path, and that taglib is properly installed.
*** Or see http://ibm.com/software/globalization/icu/
}}}

=== Solution ===

Install ICU and use `locate` to find the `icu-config` command:

{{{
locate icu-config
}}}

Take the directory from the output of this command and add it to your `PATH`:

{{{
export PATH="$PATH:/usr/local/bin"
}}}


== Incorrect LD_LIBRARY_PATH ==

=== Problem ===

{{{
$ couchdb      
Apache CouchDB 0.8.0-incubating (LogLevel=info)
Apache CouchDB is starting.

{"init terminating in do_boot",{error,{open_error,-10}}​}

Crash dump was written to: erl_crash.dump
init terminating in do_boot ()
}}}

or

{{{
$ couchdb
Apache CouchDB 0.8.1-incubating (LogLevel=info)
Apache CouchDB is starting.

{"init terminating in do_boot","libjs.so: cannot open shared object file: No such file or directory"}

Crash dump was written to: erl_crash.dump
init terminating in do_boot (libjs.so: cannot open shared object file: No such file or directory)
}}}

=== Solution ===

You must correctly set your `LD_LIBRARY_PATH` environment variable so that it picks up your installed libraries. On Mac OS X, the equivalent variable is `DYLD_LIBRARY_PATH`.

Example running as normal user:

{{{
LD_LIBRARY_PATH=/usr/local/lib:/usr/local/spidermonkey/lib couchdb
}}}

Example running as `couchdb` user:

{{{
echo LD_LIBRARY_PATH=/usr/local/lib:/usr/local/spidermonkey/lib couchdb | sudo -u couchdb sh
}}}

Similar instructions are on the InstallingSpiderMonkey page.


== Binary Architecture Mismatch ==

On Mac OS X, libraries and executables can be ''fat binaries'' that support multiple processor architectures (PPC and x86, 32 and 64 bit). But that also means you will run into problems when trying to load a library into an application if that library doesn't support the architecture used by the application process.

=== Problem ===

{{{
$ couchdb      
Apache CouchDB 0.8.0-incubating (LogLevel=info)
Apache CouchDB is starting.

{"init terminating in do_boot",{error,{open_error,-12}}​}

Crash dump was written to: erl_crash.dump
init terminating in do_boot ()
}}}

=== Solution ===

You've probably built Erlang with the 64 bit option enabled. The problem is that ICU, which CouchDB attempts to load at startup time, has not been compiled with 64 bit support, so it can't be loaded into the 64bit Erlang process.

For now you'll have to recompile Erlang, and resist the temptation to build a 64 bit binary (just omit the `--enable-darwin-64bit` option). The `--enable-darwin-universal` option works okay, but note that currently there's no universal build of ICU available.

== Unavailable Port ==

=== Problem ===

{{{
$ couchdb      
Apache CouchDB 0.8.0-incubating (LogLevel=info)
Apache CouchDB is starting.

...
[error] [<0.46.0>] {error_report,<0.21.0>,
...
               {couch_httpd,start_link,
                   ["127.0.0.1","5984","/tmp/couchdb-a/share/couchdb/www"]}},
           {restart_type,permanent},
           {shutdown,1000},
           {child_type,supervisor}]}]}}
...
}}}

=== Solution ===

Edit your `/etc/couchdb/couch.ini` file and change the `Port` setting to an available port.

== Missing OpenSSL ==

=== Problem ===

{{{
$ bin/couchdb
Apache CouchDB 0.8.0-incubating (LogLevel=info)
Apache CouchDB is starting.                                                                       

{"init terminating in do_boot",{undef,[{crypto,start,[]},{erl_eval,do_apply,5},{init,start_it,1},{init,start_em,1}]}}  

Crash dump was written to: erl_crash.dump
init terminating in do_boot ()
}}}

=== Solution ===

You need to install the OpenSSL libraries and recompile Erlang with SSL enabled.

== Incorrect Permissions ==

=== Problem ===

{{{
$ bin/couchdb
Apache CouchDB 0.9.0a691361-incubating (LogLevel=info) is starting.
{"init terminating in do_boot",{{badmatch,{error,shutdown}},[{couch_server_sup,start_server,1},{erl_eval,do_apply,5},{erl_eval,exprs,5},{init,start_it,1},{init,start_em,1}]}}

Crash dump was written to: erl_crash.dump
init terminating in do_boot ()
}}}

=== Solution ===

You need to make sure that the user running couchdb has permissions to write to /usr/local/var/lib/couchdb and /usr/local/var/log/couchdb.
