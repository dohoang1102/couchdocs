== Batteries Included ==
Newer versions of Ubuntu have CouchDB  included in their respective software repositories.  You can install CouchDB with the '''Synaptic GUI''', or from the command line with the '''apt''' or '''aptitude''' utilities, which ever you prefer.  However, to get the newest version of CouchDB you may have to install from source, or other package repositories that have newer pre-built CouchDB packages.

'''Example 1:'''

{{{
sudo aptitude install couchdb
}}}
== Using the Ubuntu installer ==
The easiest way to install the newest versions of CouchDB is using the ubuntu installer located at: http://www.couch.io/get#ubuntu.

It comes with all the libraries that CouchDB needs so there are no additional packages to install.

== Installing From Source ==
This is a basic outline of the steps required to build CouchDB from source on Ubuntu.  Like many things, there are multiple ways to achieve the same task. With that in mind, these steps may or may not be the best method for you (Example #2 below uses a javascript engine that is installed from source, which may be preffered for minimal Ubuntu systems).

 * Install CouchDBs first set of dependencies: sudo apt-get build-dep couchdb
 * Install CouchDBs second set of dependencies: sudo apt-get install libmozjs-dev libicu-dev libcurl4-gnutls-dev libtool
 '''(*NOTICE*: In Ubuntu 10.04, libmozjs-dev is no longer available.  You should use xulrunner-dev instead)'''
 * Then download the latest CouchDB source file.  The wget utility is a useful utility for this. For example: wget http://mirrors.axint.net/apache/couchdb/0.11.0/apache-couchdb-0.11.0.tar.gz
 * Untar (decompress) the source file: tar -zxvf apache-couchdb-*.*.*.tar.gz
 * Change into the expanded directory: cd apache-couchdb-*.*.*
 * Configure the build: ./configure (You may need to specify build options like the installation directory, etc.  Please reference the example(s) below.)
 * Build or Compile the source: make  (You shouldn't have any errors when this process is done.  If you do you should fix them before moving to the next step.)
 * Install your newly built CouchDB: sudo make install
 * Once the installation completes successfully, you will need to make sure that there is a CouchDB user, and that the CouchDB user owns the necessary files and directories.
 * Now you can run CouchDB manually by changing into the /bin folder of the installed directory, and running the following command: "sudo -u couchdb ./couchdb "
 * Once the server is running you can browse to http://localhost:5984/_utils.  This should take you to the Futon Web GUI.
 * To be thorough, you should run the built in tests to ensure that CouchDB is working properly.  To run the tests, click on the "Test Suite" link on the right hand side of the Futon Web GUI, then click on "Run All" to execute all of the built in tests.  All of tests should run without error on Ubuntu.
 * Once CoucDB is working properly you can add CouchDB to your startup scripts if desired.

Note: If you installed all the dependencies of Couchdb from the Synaptic GUI, but not Couchdb itself, some of the dependencies may think they are not required and the update manager may suggest that they are removed. Should you remove these dependencies, CouchDB may fail to start, perhaps with an error such as:

{{{
{"init terminating in do_boot",{undef,[{crypto,start,[]},{erl_eval,do_apply,5},{init,start_it,1},{init,start_em,1}]}}
}}}
If this happens simply re-install the dependencies (possibly erlang-nox but it could vary)

== Ubuntu 10.04 ==
=== Example 1 ===
Please see below in links for complete instructions on how to install CouchDB 1.0.0 specifically.

'''Note''': the relevant xulrunner version seems to be the output of the command: `xulrunner --gre-version`

{{{
sudo su
# Install dependencies required to build couchdb from source
apt-get build-dep couchdb
cd /opt
# download the latest release from http://couchdb.apache.org/downloads.html
# wget <url>
tar xvzf apache-couchdb-x.xx.x.tar.gz
cd apache-couchdb-x.xx.x

# see xulrunner directions below and do them this fixes problem where basic test suite fails to run.
# Note: To install couchdb in the default location use --prefix= in the configure statement
./configure --prefix= --with-js-lib=/usr/lib/xulrunner-devel-1.9.2.8/lib --with-js-include=/usr/lib/xulrunner-devel-1.9.2.8/include

# Now you can compile and install couchdb
make && make install
# Add couchdb user account
useradd -d /var/lib/couchdb couchdb
chown -R couchdb: /var/lib/couchdb /var/log/couchdb

# next two steps fix problems where adding admin hangs or setting admins in local.ini hangs the start. Also fixes problems with reader_acl test.
chown -R root:couchdb /etc/couchdb
chmod 664 /etc/couchdb/*.ini
chmod 775 /etc/couchdb/*.d

# start couchdb
/etc/init.d/couchdb start
# Start couchdb on system start
update-rc.d couchdb defaults

# Verify couchdb is running
curl http://127.0.0.1:5984/
# {"couchdb":"Welcome","version":"1.0.0"}
}}}
=== Example 2 (with minimal dependencies) ===
Tested with CouchDB versions: 0.11.0, 1.0.0

This example is especially useful when using a minimal Ubuntu, rather than a full desktop one, as it won't install as many packages as the previous example.

==== Dependencies: ====
First, install SpiderMonkey from source, as described [[Installing_SpiderMonkey|here]] (this should prevent the possible xulrunner issues described later).

Second, install the rest of the dependencies:

{{{
sudo apt-get install libicu-dev libcurl4-gnutls-dev libtool erlang-dev erlang
}}}
'''Note''': Without the 'erlang' package, couchdb could still be installed, but would be missing important erlang libraries and won't run properly.

==== Installation: ====
{{{
couch_v='1.0.0'
prefix='/usr/local'

# install:
tar zxvf apache-couchdb-${couch_v}.tar.gz
cd apache-couchdb-${couch_v}
./configure --prefix=${prefix}
make && sudo make install

# add couchdb user:
sudo useradd -d ${prefix}/var/lib/couchdb couchdb

# correct permissions:
sudo chown -R couchdb: ${prefix}/var/{lib,log,run}/couchdb ${prefix}/etc/couchdb
sudo chmod 0770 ${prefix}/var/{lib,log,run}/couchdb ${prefix}/etc/couchdb
}}}
=== Additional Notes ===
==== Problems with libmozjs and xulrunner? ====
In Ubuntu 10.04 you may get an error similar to this:

{{{
OS Process Error <0.4649.0> :: {os_process_error,{exit_status,127}}
/opt/couchdb/lib/couchdb/bin/couchjs: error while loading shared libraries: libmozjs.so: cannot open shared object file: No such file or directory
}}}
This is can be resolved by creating an xulrunner configuration as follows:

{{{
sudo vi /etc/ld.so.conf.d/xulrunner.conf
}}}
Then add the following lines to the file (You may need to change the library version to match whats installed):

{{{
/usr/lib/xulrunner-1.9.2.6
/usr/lib/xulrunner-devel-1.9.2.6
}}}
Once the configuration files is created and saved, you will need to run ldconfig:

{{{
sudo /sbin/ldconfig
}}}
This solution is referenced in this bug report @ https://bugs.launchpad.net/ubuntu/+source/xulrunner-1.9/+bug/557275

==== System updates ====
When performing system updates (using apt-get or package manager) please keep in mind that the /etc/ld.so.conf.d/xulrunner.conf file is not maintained by the system and will not be updated if a new version of xulrunner is deployed !

So please check the update content in order to determine if the xulrunner package is being updated, then make sure that you update the configuration file with new version number.

You can use the following command line in order to update your xulrunner configuration :

{{{
find /usr/lib -maxdepth 1 -type d -name "xulrunner-*" | grep -v 'addons' > /tmp/new.xulrunner.conf && sudo cp /tmp/new.xulrunner.conf /etc/ld.so.conf.d/xulrunner.conf && sudo /sbin/ldconfig
}}}
You need to re-start your couchdb server after the library configuration update !

==== Don't forget to configure logging! ====
-''Setup log rotate:''

First off, a lot of people run CouchDB from source which means that in 99% of all installs, the log rotation is not activated.

To fix this (on Ubuntu/Debian), do the following:

{{{
sudo ln -s /usr/local/etc/logrotate.d/couch /etc/logrotate.d/couchdb
}}}
,,- Don't forget to change the path to match your installation.,,

Make sure to familiarize yourself with log rotate. Depending on the space requirements and business of your installation, you should adjust your configuration so that you don't run out of disk space. If CouchDB is unable to log, it will crash.

-''Adjust the log level:''

In most cases it's more than alright to just run with a log level of error.

Add the following to your local.ini (in [log]): level = error Log directory

If you are still running out of diskspace? Add the following to your local.ini (in [log]):

file = /path/to/more/diskspace/couch.log

... if you adjusted the above, you will need to correct the config for logrotate.d as well.

-''No logging:''

Last but not least — if no logs are needed, just turn them off completely.

These logging tips is based on the recommendations found here: [[http://till.klampaeckel.de/blog/archives/95-Operating-CouchDB.html|Operating CouchDB]]

== Note on installing on  Ubuntu Desktop flavors ==
If you're *not* running Ubuntu server, but rather running some variant of Ubuntu desktop, I'd strongly recommend compiling from source and keeping the default prefix of /usr/local.  Ubuntu comes standard with couchdb-bin, and uses desktop-couch with tools like  Ubuntu One, gwibber, and evolution. But, it Lucid Lynx ships with version 0.10.0.  This is a long-term support item, but that doesn't mean Canonical will be releasing 0.11 anytime soon.

So, to install a parallel version of current CouchDB on an Ubuntu desktop system, you should download build from source, being careful to keep the default install prefix of "/usr/local", and following all of the above instructions about libraries and dependencies.

Then, after installing CouchDB, you can still get it to start at boot as normal, but because 0.11.x is in /usr/local, just running

{{{
sudo update-rc.d couchdb defaults
}}}
is probably *not* going to do the right thing.  What is seems to do is look in the /etc/init.d directory, where it will likely find the 0.10 version of CouchDB.

Instead, you have force the system to use the version of CouchDB installed in /usr/local.  There should be an option to update-rc.d that will tell it to look in /usr/local/etc rather than /etc, but I couldn't find it.

A brute force way to make it work is to do something like:

{{{
 sudo mv /etc/init.d/couchdb /etc/init.d/couchdb.0.10.donotuse
 sudo ln -sf /usr/local/etc/init.d/couchdb /etc/init.d/couchdb
 sudo update-rc.d couchdb defaults
}}}
== External Articles ==
 * [[http://h.imagehost.org/download/0072/How-to_Install_CouchDB_and_CouchDB-Lucene_on_Ubunut_Lucid|Installing CouchDB and CouchDB-Lucene on Ubunut 10.04 Lucid Lynx- PDF]]
 * [[http://www.owengriffin.com/posts/2010/04/27/CouchDB_0.11_and_CouchApp_Notes.html#comment-48272833|CouchDB 0.11 and CouchApp Notes]]
 * [[http://barkingiguana.com/2008/06/28/installing-couchdb-080-on-ubuntu-804|Installing CouchDB 0.8.0 on Ubuntu 8.04]]
 * [[http://japhr.blogspot.com/2009/03/yak-shaving-is-new-dependency-hell.html|Installing Couchdb 0.9 on Ubuntu 9.04]]
 * [[http://depth-first.com/articles/2010/01/28/pubcouch-install-couchdb-on-ubuntu-karmic-from-source|Install CouchDB on Ubuntu Karmic From Source]] ''Unfortunately, the Karmic CouchDB binary distribution is broken''
 * [[http://cs.mu/?p=20|Install CouchDB 0.11 on Ubuntu 10.4 Lucid]]
