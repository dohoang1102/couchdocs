## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl -All:write Default
#format wiki
#language en
If you're running Apache 1.3 (or an httpd based on Apache 1.3, such as OpenBSD's httpd), it's still possible to get MoinMoin working under WSGI.  It will take some additional steps.  These instructions assume you have root (superuser) privileges on the wiki server, and a dedicated virtual host name that you will use for your wiki (e.g. `mywiki.your.domain`).

Before we start, you should take note of your ''wiki directory'' (something like `/var/www/moin/mywiki`) and your ''wiki user'' (something like `www` or `www-data` -- whatever account owns the wiki directory and its content).

 1. Install <<http://www.cherrypy.org/|CherryPy>> on the wiki server.

 1. Copy `moin.wsgi` from the `wiki/server/` subdirectory of the source tree into your wiki directory.  Edit it:
 {{{#!python
#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-
"""
    MoinMoin - mod_wsgi driver script
    ...
"""

from MoinMoin.server.server_wsgi import WsgiConfig, moinmoinApp
from cherrypy.wsgiserver import CherryPyWSGIServer, WSGIPathInfoDispatcher

class Config(WsgiConfig):
    pass

config = Config()

application = moinmoinApp

def run_cherrypy(app, address='', port=8080):
    from cherrypy import wsgiserver
    d = WSGIPathInfoDispatcher({'/': app})
    server = CherryPyWSGIServer((address, port), d,
				server_name='mywiki.your.domain')
    try:
        server.start()
    except KeyboardInterrupt:
        server.stop()

run_cherrypy(application, '0.0.0.0', 8080)
 }}}
 Change the `server_name=` part and the port number, if you want.  You may use any port number greater than 1023 that's not already being used by something else.  (We'll be running this program as an unprivileged user, so we can't use ports under 1024.)  Give it execute permissions with a `chmod 755 moin.wsgi` command.

 1. Arrange for the `moin.wsgi` program to be run as your wiki user, inside the wiki directory, according to whatever techniques you use on your system for boot scripts or the like.  Start it running now.  You should see it listening on port 8080 (or whatever you set in the `moin.wsgi` file).

 1. Edit your Apache configuration (`httpd.conf` or whatever filename is correct for your system):
 {{{
...
Alias /moin_static183/ "/usr/local/share/moin/htdocs/"
...
NameVirtualHost *:80
...
<VirtualHost *:80>
ServerName mywiki.your.domain
ServerAdmin your@email.address
RewriteEngine On
RewriteCond %{REQUEST_URI} !^/moin_static.../
RewriteRule ^/(.*) http://127.0.0.1:8080/$1 [P]
ProxyRequests Off
ProxyPassReverse / http://127.0.0.1:8080/
ErrorLog /var/www/logs/mywiki.your.domain-error.log
CustomLog /var/www/logs/mywiki.your.domain-access.log combined
</VirtualHost>
 }}}
 Obviously, you should change the `htdocs` location, the port number, and the logfile locations as necessary.
 
 The `moin_static183` in the `Alias` should be changed for each version of MoinMoin.  The `moin_static...` part in the `RewriteCond` is a regular expression, so it will match every version, and doesn't need adjustment.  The purpose of the rewriting code here
 is to allow the Alias to work for the static content URLs, and rewrite (proxy) everything else to the CherryPy service.
 
 Reload or restart your Apache so that it picks up the changes.

That's basically all.  Your wiki should be visible at `http://mywiki.your.domain/` now.  Test everything and make sure it seems correct.
