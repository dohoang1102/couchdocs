## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
= Built-in test =

There's a built-in diagnostic mode that's useful when doing an install; just append "`?action=test`" to the URL of your wiki: {{{
lynx --dump http://`hostname`/mywiki?action=test
}}}

If you see an import error here, but "`python -c "import MoinMoin"`" works, it's likely a result of missing file permissions or a wrong PYTHONPATH setting within the web server environment.

= Duelling Pythons =

The most common problem you might encounter is when you have an old Python version installed into "`/usr`", and a newer Python distribution into "`/usr/local`"; this is typical for GNU/Linux distributions that still come bundled with an old Python version.

In that case, if you enter "`python`" on your prompt, you will usually get the more recent Python interpreter, because "`/usr/local/bin`" is in your `PATH`. The situation is different in your webserver environment, and thus you might have to change the bang path of "`moin.cgi`", like this:
{{{
#!/usr/local/bin/python

"""
    MoinMoin - CGI Driver Script
...
"""
}}}

= Missing file permissions =

If you are root, the installed files may be readable only by root, but they must also be readable by the web server before the wiki will work. This includes both the Python modules and the site itself. For the data directory, the wiki engine also needs ''write'' access.  To fix this, first find out where the Python module directory is; look in `install.log`, or run the command: 

{{{
python -c "import sys; print '%s/lib/python%s/site-packages' % ( sys.prefix, sys.version[:3] )"
}}}

For the example below, we'll assume that the Python module directory is `/usr/local/lib/python2.3/site-packages`.
Make the files world-readable using the following commands:
{{{
cd /usr/local
chmod -R a+rX lib/python2.3/site-packages/MoinMoin
}}}
