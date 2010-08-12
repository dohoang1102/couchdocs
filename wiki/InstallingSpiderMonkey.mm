#redirect Installing_SpiderMonkey
## page was renamed from InstallingSpiderMonkeyFromSource
{{{
make -f Makefile.ref
JS_DIST=/usr/local/spidermonkey make -f Makefile.ref export
}}}

== Notes when installing on OS X ==

 * The export needs to be run as root so use $ sudo sh
 * When running ./configure for couchdb you will need to use the --with-js-include and --with-js-lib options
 * You will need to make sure /usr/local/spidermonkey/lib is in  DYLD_LIBRARY_PATH {{{export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/spidermonkey/lib}}}
 * If you're still getting {{{dyld: Library not loaded: Darwin_OPT.OBJ/libjs.dylib}}} when trying to start couchdb, run {{{ranlib /usr/local/spidermonkey/libjs.a}}}

== Notes when installing on Linux ==

It would be best if you can install the SpiderMonkey libraries via your system's package management system, eg:

{{{
apt-get libmozjs-dev
}}}

Or:

{{{
yum install js-devel
}}}

Warning: Yum may install an older version of SpiderMonkey (1.5) that doesn't work with CouchDB. If you see build errors related to JSOPTION_NATIVE_BRANCH_CALLBACK, you will need to build a newer version of SpiderMonkey as mentioned above.

However, if you need to install from source you should make sure spidermonkey's lib directory is in LD_LIBRARY_PATH:

{{{
export LD_LIBRARY_PATH=/usr/local/spidermonkey/lib
}}}

Or if this does not work for you, set the /lib and /include locations when running ./configure by using something similar to:

{{{
./configure --with-js-lib=/usr/local/spidermonkey/lib --with-js-include=/usr/local/spidermonkey/include
}}}
