== Batteries Included ==
Newer versions of Ubuntu have CouchDB  included in their respective software repositories.  You can install CouchDB with the '''Synaptic GUI''', or from the command line with the '''apt''' or '''aptitude''' utilities, which ever you prefer.  However, to get the newest version of CouchDB you may have to install from source, or other package repositories that have newer pre-built CouchDB packages.

'''Example 1:'''

{{{
sudo aptitude install couchdb
}}}
== Installing From Source ==
This is a basic outline of the steps required to build CouchDB from source on Ubuntu.  Like many things, there are multiple ways to achieve the same task. With that in mind, these steps may or may not be the best method for you.

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

=== Installing CouchDB from source on Ubuntu 10.04 (Example 1): ===

{{{
sudo su
# Install dependencies required to build couchdb from sourece
apt-get build-dep couchdb
cd /opt
# download the latest release from http://couchdb.apache.org/downloads.html
# wget <url>
tar xvzf apache-couchdb-x.xx.x.tar.gz
cd apache-couchdb-x.xx.x
./configure --with-js-lib=/usr/lib/xulrunner-devel-1.9.2.3/lib --with-js-include=/usr/lib/xulrunner-devel-1.9.2.3/include
# Note: To install couchdb in the default location use --prefix= in the configure statement
make && make install
# Add couchdb user account
useradd -d /var/lib/couchdb couchdb
chown -R couchdb: /var/lib/couchdb /var/log/couchdb
# start couchdb
/etc/init.d/couchdb start

# Start couchdb on system start
update-rc.d couchdb defaults

# Verify couchdb is running
curl http://127.0.0.1:5984/
# {"couchdb":"Welcome","version":"0.11.0"}
}}}


=== Installing CouchDB and CouchDB-Lucen (Example 2): ===

 *  This attached document describes how to install CouchDB and CouchDB-Lucene on Ubunut 10.04 Lucid Lynx (please correct any errors you find): [[http://wiki.apache.org/couchdb/Installing_on_Ubuntu?action=AttachFile&do=view&target=How-to+Install+CouchDB+and+CouchDB-Lucene+on+Ubunut+Lucid|You can download the document here]].


=== Additional Notes ===
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
/usr/lib/xulrunner-1.9.2.3
/usr/lib/xulrunner-devel-1.9.2.3
}}}
Once the configuration files is created and saved, you will need to run ldconfig:

{{{
sudo /sbin/ldconfig
}}}
This solution is referenced in this bug report @ https://bugs.launchpad.net/ubuntu/+source/xulrunner-1.9/+bug/557275

== External Articles ==
 * [[http://www.owengriffin.com/posts/2010/04/27/CouchDB_0.11_and_CouchApp_Notes.html#comment-48272833|CouchDB 0.11 and CouchApp Notes]]
 * [[http://barkingiguana.com/2008/06/28/installing-couchdb-080-on-ubuntu-804|Installing CouchDB 0.8.0 on Ubuntu 8.04]]
 * [[http://japhr.blogspot.com/2009/03/yak-shaving-is-new-dependency-hell.html|Installing Couchdb 0.9 on Ubuntu 9.04]]
 * [[http://depth-first.com/articles/2010/01/28/pubcouch-install-couchdb-on-ubuntu-karmic-from-source|Install CouchDB on Ubuntu Karmic From Source]] ''Unfortunately, the Karmic CouchDB binary distribution is broken''
