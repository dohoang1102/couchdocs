## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl -All:write Default
#format wiki
#language en

''' How to integrate your wiki with existing Apache setup '''

There are currently 5 possibilities running a MoinMoin wiki: Using CGI, FastCGI, Mod Python, Standalone server or Twisted server. The most advanced options are FastCGI, whose license is restricted, and Mod Python, which needs a lot RAM. FastCGI and Mod Python are not available on all platforms and are known to have configuration issues. The next solution is running Twisted or Standalone servers, which are much faster than CGI and easier to configure. 

However, many people already run web servers and serve static pages or other applications, and want to add a wiki to the current setup. For them, the best option is to run MoinMoin as a Standalone or Twisted server proxied behind your existing Apache web server. This works out of the box with simple setup.

In the example setup below, we will integrate a MoinMoin wiki in our site http://www.example.com/exwiki/.


<<TableOfContents>>

= Requirements =

 1. Existing installation of Apache 1 or Apache 2 web server
 1. Existing installation of Standalone or Twisted server as explained in HelpOnInstalling.

= Integrating with Apache 2 =

== Standalone or Twisted setup ==

If you want to use Twisted, edit {{{mointwisted.py}}} and set these options:
{{{
    port = 8000
    interfaces = ['localhost']
}}}

If you want to use Standalone, edit {{{standalone.py}}} and set these options:
{{{
    port = 8000
    interface = 'localhost'
}}}

Now run your moin server and check that it works at http://localhost:8000.

== Apache 2 setup ==

This setup requires mod_proxy and mod_headers. Make sure they are installed and loaded before you continue.

Edit your Apache configuration file, either `httpd.conf` or an included configuration file:
{{{
# Can be off for reverse proxying, more secure
ProxyRequests Off

Alias /moin_static160/ "/usr/share/moin/htdocs/"

<Location /exwiki/>
    ProxyPass http://localhost:8000/
    ProxyPassReverse http://localhost:8000/
    RequestHeader set X-Moin-Location /exwiki/
</Location>
}}}

Now restart Apache and test your wiki at http://localhost/exwiki/ or http://www.example.com/exwiki/

This setup was tested on Mac OS X.

On Debian Sarge, the default Apache configuration denies all proxy access, so at least the following should be added:
{{{
<Proxy http://localhost:8080/>
  Order deny, allow
  Allow from all
</Proxy>
}}}

 /!\ If you ever change the value of the `X-Moin-Location` header, you may have to manually delete cached data for the change to show up in wiki pages. See MoinMoin:MoinMoinBugs/SiteLocationIgnoredOnEditPage for details.


= Integrating with Apache 1 =

== Standalone or Twisted setup ==

If you want to use Twisted, edit {{{mointwisted.py}}} and set these options:
{{{
    properties = {'script_name': '/mywiki', 'http_host': 'yourdomain'}
    port = 8000
    interfaces = ['localhost']
}}}

If you want to use Standalone, edit {{{standalone.py}}} and set these options:
{{{
    properties = {'script_name': '/mywiki', 'http_host': 'yourdomain'}
    port = 8000
    interface = 'localhost'
}}}

 (!) Another solution may be to use url_mapping config option.

== Apache 1 setup ==

This setup requires mod_proxy. Make sure it's installed and loaded before you continue.

Edit your Apache configuration file, either `httpd.conf` or an included configuration file:
{{{
# Can be off for reverse proxying, more secure
ProxyRequests Off

Alias /moin_static160/ "/usr/share/moin/htdocs/"

<Location /exwiki>
    ProxyPass http://localhost:8000/
    ProxyPassReverse http://localhost:8000/
</Location>
}}}

Now restart Apache and test your wiki at http://www.example.com/exwiki/

 (!) Note that your wiki will not work correctly from http://localhost:8000 with this setup.

 <!> Tested with Apache 2, should work also on Apache 1.

= Farm configuration =

When running Twisted or Standalone without a proxy, the wiki url contain the server name (and sometimes also the port) and the page name. For example: `localhost:8000/pagename`. 

However, when running behind a proxy, the wiki url contain the proxy host, not the server name, and may include a "script_name". In this case, the wiki that run on `localhost:8000` might have a url of `www.example.com/exwiki/pagename` when you access it through the proxy, and `localhost:8000/pagename` when you access it locally.

If you want to use same configuration file for both local and world access, use settings like this in your `farmconfig.py`:
{{{
wikis = [('exwiki', r'^(localhost:8000|www.example.com/exwiki).*')]
}}}

If you want to have different configuration for local and world access:
{{{
wikis = [('exwiki_local', r'^localhost:8000.*'),
         ('exwiki_world', r'^www.example.com/exwiki.*'),]
}}}

= Disabling host rewriting =

If you want to disable the new transparent host rewriting, override `http_host` in your server script:
{{{
    properties = {'http_host': 'hostname'}
}}}
