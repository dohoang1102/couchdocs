#format wiki
#language en
== Dave Cottlehuber ==
Email:dave@\muse.net.nz

----
== Building CouchDB on Windows 7 x86 64 bit ==
 1. fresh build of windows 7 x86_64
 1. install visual studio 2010 express C++ from http://www.microsoft.com/express/downloads/ to default location. Skip offer to install MSSQL + bits  & reboot 2x
 1. install cygwin 1.7.x with defaults from http://cygwin.org/setup.exe
 1. Install Sun JDK http://java.sun.com/javase/downloads/widget/jdk6.jsp which includes the JRE. I used the 64b edition & note http://java.sun.com/j2se/1.4.2/download.html is obsolete actually URL is now http://cds.sun.com/is-bin/INTERSHOP.enfinity/WFS/CDS-CDS_Developer-Site/en_US/-/USD/VerifyItem-Start/jdk-6u21-windows-x64.exe?BundledLineItemUUID=esSJ_hCw1ZMAAAEplnVM7b.B&OrderID=MoeJ_hCwdIwAAAEpjHVM7b.B&ProductID=BXiJ_hCyf.MAAAEpc7wzBGsB&FileName=/jdk-6u21-windows-x64.exe
 1. install NSIS 2.46 from http://sourceforge.net/projects/nsis/
 1. install VC++2008 runtime for OpenSSL next step http://download.microsoft.com/download/d/2/4/d242c3fb-da5a-4542-ad66-f9661d0a8d19/vcredist_x64.exe
 1. install OpenSSL binaries from http://www.slproweb.com/products/Win32OpenSSL.html specifically  the 64b version http://www.slproweb.com/download/Win64OpenSSL-1_0_0a.exe
 1. reboot...

== Useful links ==
http://github.com/apache/couchdb/blob/trunk/README

http://github.com/apache/couchdb/blob/trunk/INSTALL.Windows

http://www.erlang.org/doc/installation_guide/INSTALL-WIN32.html

http://sourceforge.net/projects/nsis/

----
CategoryHomepage
