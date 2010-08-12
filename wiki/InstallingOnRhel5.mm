#redirect Installing_on_RHEL5
Installing on RHEL5 x86_64

1. Install prerequisites. You will need EPEL for js and erlang.

{{{
yum install ncurses-devel openssl-devel icu libicu-devel js js-devel curl-devel erlang
}}}

2. Install couchdb
{{{
svn checkout http://svn.apache.org/repos/asf/incubator/couchdb/trunk couchdb
cd couchdb
./bootstrap
./configure && make && make install
}}}

3. Edit config file to suit

{{{
vi /usr/local/etc/couchdb/couch.ini
}}}

4. Create users, chown directories
{{{
adduser -r -d /usr/local/var/lib/couchdb couchdb
chown -R couchdb /usr/local/var/lib/couchdb
chown -R couchdb /usr/local/var/log/couchdb
}}}

5. Launch! In console:
{{{
sudo -u couchdb couchdb
}}}
or as daemon:
{{{
sudo /usr/local/etc/rc.d/couchdb start
}}}
