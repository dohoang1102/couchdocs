## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## page was renamed from ApacheVoodoo
##acl MoinPagesEditorGroup:read,write,delete,revert All:read
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en

<<TableOfContents>>

/!\ Voodoo is not for newbies!

This page gives some nice but advanced tricks for a moin apache setup. The directives on this page assume that you have knowledge about apache configuration, newbies should stick to the basic setup.

= Apache Root Wiki =

/!\ This requires an apache including mod_rewrite (which should be standard)

An apache root wiki is a easy thing, but it has its 'edges': cause moin needs to access certain static files (images, css, etc.) its steals a part of the possible WikiName namespace.

 1. Install moin as normal.
 1. Put all static files into one distinct path below your docroot. ''In this example we call it `_static`.''
 1. Edit wikiconfig to reflect the place of the static files. ''This normally means to change `url_prefix`.''
 1. Add the following lines to your apache (vhost?) config: {{{
  RewriteEngine On
  RewriteLogLevel 0
  ## if URL starts with our static prefix, don't change and abort
  RewriteRule ^/_static - [last]
  ## static files are somewhere else? ok...
  # RewriteRule ^/_static(.*)$ /path/to/static$1 [last]
  ## map everything else to moin.cgi/moin.fcg
  RewriteRule ^(.*)$ /path/to/moin.cgi$1 [type=application/x-httpd-cgi]
  # RewriteRule ^(.*)$ /path/to/moin.fcg$1 [type=application/x-httpd-fcgi]
}}}

The RewriteRule for Fast''''''CGI here does not work for me: {{{
[Wed Jan 05 01:43:41 2005] [error] [client 10.0.0.1] File does not exist: /home/apache/moin/wiki/share/moin/pw/moin.fcg/RecentChanges, referer: http://moin.dahoam/StartSeite
duplo:/home/danielt# ls /home/apache/moin/wiki/share/moin/pw/moin.fcg
-rwxr-xr-x  1 root  www  1088 Jan  4 23:35 /home/apache/moin/wiki/share/moin/pw/moin.fcg*
}}}

As a workaround I use this: {{{
  RewriteRule ^/?(.*) /_Wikiscript_/moin.fcg/$1
  RewriteRule ^/_Wikiscript_/(.*) /home/apache/moin/wiki/share/moin/pw/$1 [last]
}}}

= Root wiki with mod python recipe =

Using the previous example, I got this working like this:

 1. Install moin as usual and create instance
 1. Use this config in httpd.conf
  {{{
NameVirtualHost 192.115.134.51:80
<VirtualHost 192.115.134.51:80>
    ServerName wiki.nirs.dyndns.org
    ServerAlias wiki
    
    # Rewrite urls
    RewriteEngine On
    RewriteLogLevel 0
    # map static files to htdocs
    RewriteRule ^/wiki/(.*)$ /usr/share/moin/htdocs/$1 [last]
    # map everything else to server script
    RewriteRule ^(.*)$ /usr/share/moin/mywiki/moinmodpy.py$1

    <Directory "/usr/share/moin/mywiki">
        # These are copied from the default cgi-bin directory
        AllowOverride None
        Options None
        Order allow,deny
        Allow from all

        # Modpy stuff
        AddHandler python-program .py
        # Add the path to the wiki directory, where moinmodpy.py and 
        # wikiconfig.py are located.
        PythonPath "['/usr/share/moin/mywiki'] + sys.path"
        PythonHandler moinmodpy
        PythonDebug On 
    </Directory>
</VirtualHost>
}}}

(!) It seems to be impossible to get a root modpy wiki without using the moinmodpy wrapper script.
