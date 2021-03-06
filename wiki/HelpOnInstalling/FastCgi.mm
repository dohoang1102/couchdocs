## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
## page was renamed from HelpOnInstalling/ApacheWithFastCgi
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl -All:write Default
#format wiki
#language en

FastCGI is a method which enables a web server to communicate with long-running scripts. This has the advantage that the script is only
started and initialized one time, and that data could be cached in memory from request to request, enhancing the performance of the CGI application.

 /!\ Follow the basic installation for your operating system as described in other parts of the MoinMoin installation documentation. This is HelpOnInstalling/BasicInstallation and HelpOnInstalling/WikiInstanceCreation, or HelpOnInstalling/ApacheOnLinux in most cases. 

<<TableOfContents>>


== Using MoinMoin with FastCgi ==

For more general information:

 * http://fastcgi.com - FastCGI Homepage
 * <<http://cryp.to/publications/fastcgi/|FastCGI — The Forgotten Treasure>> (introduction)

== Deploying on Apache ==

To deploy MoinMoin using FastCGI you need an apache with mod_fastcgi. Please refer to the documentation of mod_fastcgi ( <<http://www.fastcgi.com/mod_fastcgi/docs/mod_fastcgi.html|mod_fastcgi homepage>> ).

Don't forget to install the fastcgi Apache module (e.g. libapache2-mod-fastcgi). Then in places where the documentation refers to `moin.cgi` you use `moin.fcg` instead. Be sure that '''.fcg''' is handled by the FastCGI module (`AddHandler fastcgi-script .fcg` in your apache config).

Normally Apache will start CGI scripts with its own user and group, or with the user and group of the !VirtualHost if you are using the suexec wrapper. To enable this with FastCGI you need to use `FastCgiWrapper On` in your Apache config (check your distributions and/or FastCGI Documentation).

Be sure to restart your Apache after you changed py files (i.e. the config) for a running FastCGI server, or you won't see any changes!

=== Script options ===
No matter how and where you install or how you configure, you can add some options (in Apache config or as self-running process). Here is a list of some options.


=== FastCgiExternalServer ===

{{{
-host [hostname:port]     - The port and on what host name to respond.
-idle-timeout [seconds]   - The number of seconds of inactivity allowed before request is aborted.
}}} 

=== FastCgiServer ===

{{{
-port [port]              - The port the application will use for communication with the web server.
-idle-timeout [seconds]   - The number of seconds of inactivity allowed before request is aborted.
}}}


=== Example for Apache2 on Debian ===
Edit the /etc/apache2/conf.d/your_wiki:
{{{
<IfModule mod_fastcgi.c>
   AddHandler fastcgi-script .fcgi .fcg
   FastCgiServer /your/path/to/moin.fcg -idle-timeout 60 -processes 1
   ScriptAlias /your_wiki "/your/path/to/moin.fcg"
</IfModule>
}}}
 * number of processes depends on your hardware..
Expand the Apache installation:
{{{
apt-get install libapache2-mod-fastcgi
a2enmod fastcgi
apache2ctl graceful
}}}
Now, your wiki should respond a little faster.

=== Running as an external application and/or on Windows ===

''(see also ../ApacheOnWin32withFastCgi for a Windows-specific how-to)''


!MoinMoin can be run as an external application that answers FastCGI request via a local TCP/IP socket. This works on Windows as well. All you need to do (after having installed `mod_fastcgi` and a working !MoinMoin instance) is this:

 1. Select a port number for the internal communication. It should be larger than 1023. For this example, we chose 8888 (just for fun).

 1. Add the following lines to your httpd.conf:{{{
Alias /moin.fcg "/your/path/to/moin.fcg"
FastCgiExternalServer "/your/path/to/moin.fcg" -host localhost:8888
}}}

 1. Edit `moin.fcg`. Replace{{{
fcg = thfcgi.FCGI(handle_request, max_requests=max_requests, backlog=backlog, max_threads=max_threads)
}}} with {{{
fcg = thfcgi.FCGI(handle_request, 0, 8888, max_requests=max_requests, backlog=backlog, max_threads=max_threads)
}}}

 1. Start the file `moin.fcg` manually like a Python script:{{{
python moin.fcg
}}}

 1. Start Apache.

=== Fallback to CGI if FastCGI is not available ===

Install and test MoinMoin according to HelpOnInstalling/ApacheOnLinux. Then make and test the changes to run mod_fastcgi. If you are satisfied, you can add the following block to your apache config:
{{{
<IfModule !mod_fastcgi.c>
    ScriptAlias /mywiki "/your/path/to/moin.cgi"
</IfModule>
<IfModule mod_fastcgi.c>
    AddHandler fastcgi-script .fcg
    ScriptAlias /mywiki "/your/path/to/moin.fcg"
</IfModule>
}}}
Now Apache will use mod_fastcgi if available and otherwise use the slow cgi script.

== Deploying on lighttpd ==
This is about running a wiki under "/" URL with lighttpd.

The moin.fcg processes will get spawned by lighttpd automatically (thus, if you want to restart moin, just restart lighttpd).

It will also take care about handling robots.txt and favicon.ico correctly.

First add fastcgi and rewriting support to your lighttpd.conf (if you don't already have it):
{{{
server.modules              = (
                                "mod_access",
                                "mod_rewrite",      # <--- IMPORTANT!
                                "mod_status",
                                "mod_fastcgi",      # <--- IMPORTANT!
                                "mod_accesslog",
                                "mod_redirect",
                                "mod_auth",
                                "mod_expire",
)
}}}

Then configure it to run moin.fcg for your wiki site and also serve the static stuff:
{{{
$HTTP["host"] =~ "^(www\.)?example\.org" {
    url.rewrite-once = (
        "^/robots.txt" => "/robots.txt",
        "^/favicon.ico" => "/favicon.ico",
        "^/moin_static161/(.*)" => "/moin_static161/$1",
        "^/(.*)" => "/wiki-engine/$1"
    )
    server.document-root        = "/srv/org.example/htdocs/"
    $HTTP["url"] =~ "^/wiki-engine/" {
      fastcgi.server = ( "/wiki-engine" =>
        (( "docroot"   => "/",
           "min-procs" => 10,
           "max-procs" => 10,
           "max-load-per-proc" => 2,
           # allocate successive port numbers for each process, starting with "port"
           "bin-path"  => "/srv/org.example/bin/moin.fcg",
           "host"      => "127.0.0.1",
           "port"      => 3060,
           "check-local" => "disable",
        ))
      )
    }
}
}}}

Finally adapt moin.fcg:
{{{
class Config(FastCgiConfig):
    loglevel_file = logging.INFO
    logPath = '/srv/org.example/logs/moin.log'
    max_requests = 1000
    properties = {'script_name': '/'}  # <--- IMPORTANT!
}}}

=== Using HTTP Authentication ===

lighttpd mod_fastcgi does not add the AUTH_TYPE variable to the cgi environment, which will cause http auth in moin to fail.  
See http://trac.lighttpd.net/trac/ticket/889 for more information, and an attached diff file to correct to issue.

=== MoinMoin Startup script ===

Here is a startup script for Mac OS X, using DarwinPortsStartup system. It is probably useful for other unix like platforms.

{{{
#!/bin/sh

# Start and stop multiple moin fast cgi instances runnings on PORTS

NAME="moin"
DIR="/www/org.mywiki/bin"
FCGIAPP="./moin.fcg"
PREFIX="/usr/local"

# List of ports to start moin instances on, separated with whitesapce
# Keep in sync with fastcgi.server in lighttpd.conf
PORTS="1080 1081"

start_on_port () {
    # Start moin instance on port, leaving pid file
    port=$1
    
    cd "${DIR}" && sudo -u www "${PREFIX}/bin/spawn-fcgi" \
        -f "${FCGIAPP}" \
        -p $port \
        -P "${NAME}-${port}.pid" \
        > /dev/null
}

kill_on_port () {
    # Try to kill process using pid in pid file, then remove the pid file
    pidFile="${DIR}/${NAME}-$1.pid"
    kill `cat "$pidFile"` && rm -f "$pidFile" > /dev/null 
}

start () {
    for port in $PORTS; do start_on_port $port; done 
}

stop () {
    for port in $PORTS; do kill_on_port $port; done
}

case "$1" in
start)
    # XXX starting twice will break pid files (bug in spawn-fcgi)
    start && echo -n " $NAME"
	;;
stop)
	stop && echo -n " $NAME"
	;;
restart)
    stop
    start && echo -n " $NAME"
	;;
*)
	echo "Usage: `basename $0` {start|stop|restart}" >&2
	;;
esac

exit 0
}}}

=== Mac OS X: Adding MoinMoin startup script ===

With this script, moin instances will be started automatically on startup.

 1. Install <<http://darwinports.opendarwin.org/getdp/|darwinports>>
 2. Install !DarwinPortsStartup package: {{{
sudo port install DarwinPortsStartup
}}}
 3. Copy moin.sh into `/opt/local/etc/rc.d`: {{{
sudo cp moin.sh /opt/local/etc/rc.d
}}}
