## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#format wiki
#language en

HelpContents > HelpOnAdministration > HelpOnInstalling

<<TableOfContents(3)>>

= Introduction =
This document describes how to install [wiki:MoinMoin MoinMoin] on the webserver of your ISP. I will assume a few things:
 * Your ISP supports python via CGI.
 * You have no telnet/ssh-access to the webserver, but ftp access. 
 * You are not allowed to write into python's {{{site-packages}}} directory.
 * You are not allowed to access apache's main config file. 

== Get ready ==
Download the latest distribution of Moin``Moin from its [wiki:MoinMoin/FrontPage homepage]. Unpack it into a local directory. On a windows machine, you could use [http://www.winzip.com WinZip]. On Linux, open a shell and type
{{{
tar xzf moin-1.3.3.tar.gz
}}}
For the present puropse, it is not necessary to run the setup. We just work with the source code.

== Explore the webserver configuration ==
Now it is time to find out how your ISP supports python. Unfortunately, python is not as popular as PHP. Therefore, it is quite likely that your ISP does not support fancy python stuff like {{{mod_python}}}. If they support python at all, they probably support the Common Gateway Interface (CGI). As noted above, I describe only this installation option. Now there is some homework for you to do:
 * Find out where the python binary resides on your webserver. You should be able to find some hints in the ISPs online documentation, or you can ask their support team, or you can guess. Common locations are {{{/usr/bin/python}}}, {{{/usr/bin/python2.3}}} or {{{/usr/local/bin/python}}}. Sometimes, an ISP chooses to support more than one python version, usually indicated by a version number in the search path. If possible, choose the latest version. ''Modify the first line of the explore script and the `moin.cgi` file to match the path of the python executable.''
 * Try to find a place where python scripts can be executed. To help you with that task, I have written a small script. Upload it to your webserver and see whether it gets executed or not. Here are some hints:
    * Use your favorite FTP-client and transfer your script to your webserver's {{{cgi-bin}}} directory, using the {{{.cgi}}} file extension. Try to call its URL via a web browser. If you don't have a {{{cgi-bin}}},
    * copy the script into your favorite directory on your webserver, using the {{{.py}}} or {{{.cgi}}} file extension. Try to call its URL via a web browser.
    * First check it using the {{{.cgi}}} extension, then try the {{{.py}}} extension if necessary.
{{{#!python
#!/usr/bin/python2.3

import os.path
import os
import sys

try:
    __file__
except NameError:
    __file__ = '?'

print """Content-type: text/html

<html><head><title>Python Exploration</title></head><body>
<table border=1>
<tr><th colspan=2>1. System Information</th></tr>
<tr><td>Python</td><td>%s</td></tr>
<tr><td>Platform</td><td>%s</td></tr>
<tr><td>Absolute path of this script</td><td>%s</td></tr>
<tr><td>Filename</td><td>%s</td></tr>
""" % (sys.version,
       sys.platform,
       os.path.abspath('.'),
       __file__)
print "<th colspan=2>2. Environment Variables</th>\n"
for variable in os.environ:
    print "<tr><td>%s</td><td>%s</td></tr>\n" % (variable, os.environ[variable])
print "</table></body></html>"
}}}
Download: attachment:explore.py

Some of the following problems may show up:
 * If only the source code appears in your browser window, your file has not been processed by the CGI. Probably some kind of apache configuration is required to make things work. Consult your ISPs documentation. 
 * If you encounter a {{{404 Not found}}} error, that probably means what it says: you have chosen the wrong URL.  
 * If you have errors in your script, apache usually reports an {{{Internal Server Error}}}.
 * If your script has wrong file privileges, apache may report a {{{Premature End of Script Headers}}}. Set the file permission so as to allow execution of the script. Your FTP-client will do the job.

If everything works, a table should appear on your screen. It gives you some basic information on your webserver. Later we will need '''python version''', '''absolute path of this script''', '''{{{DOCUMENT_ROOT}}}''' and '''{{{SITE_URI}}}'''.

= Copy directories =
You have to transfer four directories to your webserver.
 * {{{moin-1.3.3/wiki/htdocs}}} contains static files (e. g. css stylesheets and icons). Place this directory on your server somewhere under apache's {{{DOCUMENT_ROOT}}} and rename it to 'wiki'. Apache has to deliver them directly.
 * {{{moin-1.3.3/wiki/underlay}}} contains wiki templates and help pages. Place this directory on your server outside the {{{DOCUMENT_ROOT}}}, if possible. Apache should not be able to deliver these files directly.
 * {{{moin-1.3.3/wiki/data}}} is going to contain your wiki pages. Place this outside apache's {{{DOCUMENT_ROOT}}}.
 * {{{moin-1.3.3/MoinMoin}}} contains python source code. Place this outside apache's {{{DOCUMENT_ROOT}}}.
||<bgcolor="#FFAAAA">'''SECURITY WARNING''': If you have no choice but to place {{{MoinMoin}}}, {{{underlay}}} or {{{data}}} under apache's {{{DOCUMENT_ROOT}}}, it is very important to hinder apache from directly accessing them.||
||1. Use your favorite editor to create a file named {{{.htaccess}}}.||
||2. Insert into this file the text {{{deny from all}}}||
||3. Copy it via FTP into the directory you want to protect. ||
||4. Try to access the protected directory via your webbrowser. If protection does work, you should see {{{Access denied}}}.||
||<bgcolor="#FFAAAA">5. '''If you cannot protect these directories, please delete them from your webserver immediately. Do not continue your installation.'''||

= Configure =
There are two files that need fine tuning: 
 * {{{moin-1.3.3/wiki/server/moin.cgi}}} is going to be called by apache whenever a wiki page is requested.
 * {{{moin-1.3.3/wiki/config/wikiconfig.py}}} contains configuration options for your wiki.
Choose a location for these files on your webserver. You are free to choose, but apache must be able to execute {{{moin.cgi}}}. If necessary, you can even rename {{{moin.cgi}}}, for example to {{{moin.py}}}. I would recommend placing {{{wikiconfig.py}}} in a separate {{{config}}} directory that is not accessible by apache. Do not start uploading, we are going to make some modifications first.
== moin.cgi ==
Now open {{{moin-1.3.3/wiki/server/moin.cgi}}} in your favorite editor. 

'''(1) Adjust python path'''. First you have to adjust your python path in line 1. The new value depends on your ISPs setting.
{{{
#!/usr/bin/python
}}}

'''(2) Set the path to Moin``Moin.''' You will find a line
{{{
## sys.path.insert(0, 'PREFIX/lib/python2.3/site-packages')
}}}
Uncomment this line and replace the path information. If you have run attachment:explore.py on your webserver, you may use your knowledge of '''absolute path of this script''' to guess the absolute path to the {{{MoinMoin}}} directory.

'''Example''': You transfered {{{explore.py}}} with your FTP-client into {{{/public_html}}} on your webserver. {{{Absolute path of this script}}} reveals {{{/home/nowhere.com/public_html}}}. You transfered {{{MoinMoin}}} to {{{/MoinMoin}}}. You plan to place {{{moin.cgi}}} as {{{/pubic_html/index.py}}} on your webserver. You would have to insert
{{{
sys.path.insert(0, '/home/nowhere.com')   # REPLACED!
}}}

Of course a relative path will be allright, too. So, sticking to our example, you could also insert
{{{
sys.path.insert(0, '..')
}}}
'''(3) Set the path to wikiconfig.py.''' Now search for
{{{
sys.path.insert(0, '/path/to/wikiconfig')
}}}
Insert the path to {{{wikiconfig.py}}} on your webserver.

'''Example''': You transfered {{{explore.py}}} with your FTP-client into {{{/public_html}}} on your webserver. {{{Absolute path of this script}}} reveals {{{/home/nowhere.com/public_html}}}. Your planned location for {{{wikiconfig.py}}} is {{{/config}}}. You plan to place {{{moin.cgi}}} as {{{/pubic_html/index.py}}} on your webserver. You would have to insert
{{{
# choose one:
sys.path.insert(0, '/home/nowhere.com/config')           # absolute path
sys.path.insert(0, '../config')                          # path relative to moin.cgi
}}}

== wikiconfig.py ==
Open {{{moin-1.3.3/wiki/config/wikiconfig.py}}}. 

'''(1) Set the path to your {{{data}}} directory'''. Try to find
{{{
data_dir = './data/'
}}}
Replace {{{'./data/'}}} with whatever leads to your data directory.

'''Example:''' You transfered {{{explore.py}}} with your FTP-client into {{{/public_html}}} on your webserver. {{{Absolute path of this script}}} reveals {{{/home/nowhere.com/public_html}}}. You transfered {{{data}}} to {{{/data}}}. You plan to place {{{moin.cgi}}} as {{{/pubic_html/index.py}}} on your webserver. You would have to insert
{{{
# choose one:
data_dir = '/home/nowhere.com/data/'   # absolute path
data_dir = '../data/'                  # path relative to moin.cgi
}}}

'''(2) Set the path to your {{{underlay}}} directory'''. Try to find
{{{
data_underlay_dir = './underlay/'
}}}
Replace {{{'./underlay/'}}} with whatever leads to the {{{underlay}}} directory on your webserver.

'''Example:''' You transfered {{{explore.py}}} with your FTP-client into {{{/public_html}}} on your webserver. {{{Absolute path of this script}}} reveals {{{/home/nowhere.com/public_html}}}. You transfered {{{underlay}}} to {{{/underlay}}}. You plan to place {{{moin.cgi}}} as {{{/pubic_html/index.py}}} on your webserver. You would have to insert
{{{
# choose one:
data_underlay_dir = '/home/nowhere.com/data/'   # absolute path
data_underlay_dir = '../data/'                  # path relative to moin.cgi
}}}

'''(3) Set the URL of your static files.''' Try to find
{{{
url_prefix = '/wiki'
}}}
If you copied your {{{htdocs}}} directory to {{{/wiki}}} under your document root, you don't need to change this.

'''Example:''' You placed {{{explore.py}}} under {{{/public_html}}} and called it with {{{http://www.your-domain.com/explore.py}}}. You placed {{{htdocs}}} as {{{/public_html/wiki}}}. So url_prefix is correct as it is, don't change it.

'''(4) Set configuration options.''' If you browse through {{{wikiconfig.py}}}, you will see a bunch of options. Set these options as you like. See HelpOnConfiguration for details.

== Upload moin.cgi and wikiconfig.py ==
You are done! Upload {{{moin.cgi}}} and {{{wikiconfig.py}}} and test your wiki by calling {{{moin.cgi}}} through your webbrowser. You may have to set file permissions manually to allow the execution of {{{moin.cgi}}}. Be sure to upload both files to the directories described above.

= Summary =
Here is a short summary of an example installation. Having read this document, I hope you see what I did and why I did it.
{{{

ftp       moin-1.3.3/wiki/data       ==>           /data
ftp       moin-1.3.3/wiki/htdocs     ==>           /wiki
ftp       moin-1.3.3/wiki/underlay   ==>           /underlay
ftp       moin-1.3.3/MoinMoin        ==>           /MoinMoin

ftp       create directory     /config

create     moin-1.3.3/.htaccess      insert content:
deny from all

ftp       moin-1.3.3/.htaccess      ==>           /data
ftp       moin-1.3.3/.htaccess      ==>           /underlay
ftp       moin-1.3.3/.htaccess      ==>           /MoinMoin
ftp       moin-1.3.3/.htaccess      ==>           /config

edit moin-1.3.3/wiki/server/moin.cgi:

  replace:
           #!/usr/bin/env python
    by:
           #!/usr/bin/python2.3

  replace:
           ## sys.path.insert(0, 'PREFIX/lib/python2.3/site-packages')
    by:
           sys.path.insert(0, '.')

  replace:
           sys.path.insert(0, '/path/to/wikiconfig')
    by:
           sys.path.insert(0, './config')

ftp      moin-1.3.3/wiki/server/moin.cgi   ==>     /moin.py
    
edit moin-1.3.3/wiki/config/wikiconfig.py:

   set data_dir:
                   data_dir = './data/'

   set data_underlay_dir:
                   data_underlay_dir = './underlay/'

   set url_prefix:
                   url_prefix = '/wiki'

ftp      moin-1.3.3/wiki/config/wikiconfig.py   ==>    /config/wikiconfig.py
}}} 
