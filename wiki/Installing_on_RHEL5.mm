= Installing on RHEL 5 =
These instructions also work on Red Hat Enterprise Linux compatible distributions like CentOS.

Note: [[https://issues.apache.org/jira/browse/COUCHDB-315|COUCHDB-315]] has an attached patch for the CouchDB README which adds instructions for RHEL 5.

== Installing a prepackaged CouchDB ==
1. Enable the  [[http://fedoraproject.org/wiki/EPEL|EPEL]] repository.

2. Install the couchdb package from EPEL:

{{{
# yum install couchdb
}}}
3. Edit config file to suit:

{{{
# vi /etc/couchdb/local.ini
}}}
4. Start CouchDB:

{{{
# service couchdb start
}}}
5. Set it to start automatically on reboots:

{{{
# chkconfig --level 345 couchdb on
}}}
== Building CouchDB from source ==
1. Install prerequisites. You will need to enable the [[http://fedoraproject.org/wiki/EPEL|EPEL]] repository for the js-devel and erlang packages (or build js and erlang from source).

{{{
# yum install libicu-devel openssl-devel curl-devel make gcc erlang js-devel libtool which
}}}
1.1 If installing CouchDB >= 0.11, you will need cURL>= 7.18. Currently neither [[http://fedoraproject.org/wiki/EPEL|EPEL]], nor [[http://iuscommunity.org/|IUS]] provide a current enough [[http://curl.haxx.se/libcurl/|libcurl]]. Visit the curl [[http://curl.haxx.se/download.html|download page]] for the most recent curl package.

{{{
$ wget http://curl.haxx.se/download/curl-7.20.1.tar.gz
$ tar -xzf curl-7.20.1.tar.gz
$ cd curl-7.20.1
$ ./configure --prefix=/usr/local
$ make
$ make test
# make install
}}}
2. Install CouchDB

The configure line below is for 64-bit, adjust for your arch (or leave out --with-erlang if configure can find out for itself). You can use a release tarball instead of a checkout, in that case skip right to the ./confgure line.

{{{
$ svn checkout http://svn.apache.org/repos/asf/couchdb/trunk couchdb
$ cd couchdb
$ ./bootstrap
$ ./configure --with-erlang=/usr/lib64/erlang/usr/include
$ make
# make install
}}}
3. Edit config file to suit

{{{
# vi /usr/local/etc/couchdb/local.ini
}}}
4. Create user, modify ownership and permissions

Create the couchdb user:

{{{
# adduser -r --home /usr/local/var/lib/couchdb -M --shell /bin/bash --comment "CouchDB Administrator" couchdb
}}}
See the README for additional chown and chmod commands to run.

5. Launch!

{{{
# sudo -u couchdb couchdb
}}}
Or as daemon:

{{{
# /usr/local/etc/rc.d/couchdb start
}}}
6. Run as daemon on start-up:

{{{
# ln -s /usr/local/etc/rc.d/couchdb /etc/init.d/couchdb
# chkconfig --add couchdb
# chkconfig --level 345 couchdb on
}}}
