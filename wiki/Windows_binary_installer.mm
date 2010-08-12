<<TableOfContents>>

= Current Version =
'''couchdb-1.0.0''' - get the installer [[http://people.apache.org/~mhammond/dist/1.0.0/|here]]

As the manual recommends exercise the CouchDB tests from Futon, to verify that installation is successful.

=== Installing as a Windows Service ===
Should several tests fail with "permission errors", check the Windows service parameters.  You will need to be logged in from an Administrator account to do this. 
 * After installation, start the Windows ''Services'' management component.
 * Click on ''Apache CouchDB'' service and select the [''Log On'']] tab.
 * You may find that "'''''Log on as'':'''" has not been set.  You can either select
  *  ''Local System account'', or 
  *  ''This account'' and specify a user or other account on your PC.  
 * If you are using your CouchDB outside your own machine, say on the LAN -- Using the ''This account'' option with curtailed privileges is highly recommended (''by me'').
'''See also''': 
 1. ReadMe file
 1. https://issues.apache.org/jira/browse/COUCHDB-326

== Supported / Tested Platforms ==

This installer has been tested on Windows 7 (64 bit) Windows Vista (32 and 64 bit) and Windows XP (32 bit).  It is likely to work on other Windows versions released this decade.

== Dependencies ==

None - the installer includes erlang, openssl, spidermonkey and everything else you need.

= Snapshots =

Occasionally "snapshot" builds of couchdb will be made available [[http://people.apache.org/~mhammond/dist/snapshots|here]].  These will usually be snapshots of the trunk, although previews of release branches may occasionally also exist.

= Older Versions =

== 0.11 ==
 '''couchdb-0.11.0''' - get the installer [[http://people.apache.org/~mhammond/dist/0.11.0|here]]

== 0.8 ==

==== Supported / Tested Platforms ====

This installer has been tested on:

 * Windows XP SP3 32 bit
 * Windows Vista 32 bit

==== Dependencies ====

You need to install these before running the installer couchdb:
 * [[http://www.erlang.org/download.html|Erlang/OTP]]
 * [[http://www.microsoft.com/downloads/details.aspx?familyid=9B2DA534-3E03-4391-8A4D-074B9F2BC1BF&displaylang=en|Visual C++ 2008 Redistributables (for openssl binary)]]
 * [[http://www.openssl.org/related/binaries.html|OpenSSL]] ( [[http://www.slproweb.com/download/Win32OpenSSL_Light-0_9_8i.exe|This version]] has been used successfully )


=== Downloads ===


The installer (and some more info) can be found [[http://www.brunomlopes.com/software/couch-db-binaries|here]]. 
[[http://dl.getdropbox.com/u/118385/CouchDbBinaries/couchdb-0.8.1-win32.exe|This]] is the direct link to the file.
