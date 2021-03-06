## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl -All:write Default
#format wiki
#language en
= Introduction =
Have you ever wondered why we have so many pages in the main distribution? Mostly because we do not have a format to deliver the help pages in one file. Or why installing a theme is not easy because you do not always know where to put the files? 

The package installer is a scripting framework for MoinMoin which simplifies installing and delivering extensions for MoinMoin very much.

You could use this system to bundle specific templates which e.g. enhance your MoinMoin to be a CRM system. Or you could make your plugins/themes easier installable.

== Installing a package ==
Some ''superuser'' (i.e. a user name contained in cfg.superuser list in the configuration) of the wiki will download your package file from somewhere, upload it to the wiki and then click install in the attached files view. Additionally, he could install the package using the command line (`MoinMoin/packages.py i package.zip`).

== Creating packages ==
There are multiple possibilities to create a package. You can use the !PackagePages action in order to build a package automatically.

Or you can do it manually: you ''create'' a zip file which contains your files and a special file `MOIN_PACKAGE`, the installation script. The script contains one command (sounds complicated but is not really, look at the examples below) per line and gets executed from top to bottom.

Example script:{{{
MoinMoinPackage|1
ReplaceUnderlay|mypage.txt|HelpContents
AddRevision|mypage2.txt|FrontPage
InstallPlugin|myparser.py|global|parser|myparser.py
}}}
 * The first line simply marks the file as a script file and sets the revision of the used language. For now, it will be 1.
 * The second line replaces the underlay version of the page HelpContents with the file `mypage.txt`.
 * The third line adds a new revision to the page FrontPage, i.e. changes it.
 * The fourth line installs a new parser.

=== Implemented commands ===

Note that the commands are not case-sensitive.

 * `Print|text`
  * Prints the text into the script output, the user will see it afterwards.
 * `IgnoreExceptions|boolean`
  * Sets the ignore exceptions setting. If exceptions are ignored, the script does not stop if one is encountered.
 * `SetThemeName|themename`
  * Sets the name of the theme which will be altered next.
 * `CopyThemeFile|filename|type|target`
  * Copies a theme-related file (CSS, PNG, etc.) into a directory of the current theme.
  * Currently just supported on standalone-like servers.
  * Example: `CopyThemeFile|screen.css|css|screen.css`
 * `InstallPlugin|filename|visibility|plugintype|target`
  * Copies a plugin file from ''filename'' to ''target''. ''Visibility'' may be `local` which selects the plugin folder of the current wiki or `global` will selects the folder of the !MoinMoin python package. ''plugintype'' could be `parser`, `macro`, etc. 
  * Example: `InstallPlugin|myparser.py|global|parser|myparser.py`
 * `AddRevision|filename|pagename|author|comment|trivial`
  * Adds a revision (read from the file ''filename'') to the page ''pagename''. ''author'' specifies the name of the editor and is optional. ''comment'' specifies the comment of the revision and is optional. ''trivial'' specifies if the revision was a trivial edit and is optional.
  * Example (installs new template files):{{{
AddRevision|cust.tpl|CustomerTemplate
AddRevision|phone.tpl|PhoneTemplate
}}}
 * `DeletePage|pagename|comment`
  * Deletes the page ''pagename'', optionally setting ''comment''.
  * Example: `DeletePage|FrontPage`
 * `ReplaceUnderlay|filename|pagename`
  * Replaces the underlay version of the page. It can be used to install underlay pages or update them.
 * `EnsureVersion|version|lines`
  * Aborts the script or skips lines if the version criteria is not met and ''lines'' is specified.
  * This example supplies to different parsers and installs the correct one: {{{
EnsureVersion|1.3.3|2
InstallPlugin|myparser.py_3|global|parser|myparser.py
Exit
EnsureVersion|1.3.2
InstallPlugin|myparser.py_2|global|parser|myparser.py
}}}
 * `Exit`
  * Stops the script.
 * `InstallPackage|Pagename|Filename`
  * Installs another package which has to be an attachment called ''Filename'' of the page ''Pagename''.
  * Example: `InstallPackage|FrontPage|MyCoolPlugin.zip`
 * `AddAttachment|filename in zip file|filename|pagename|author|comment`
  * Example: `AddAttachment|2_attachment|song.wav|FrontPage|HansMustermann|thats an example song.`
 * `DelAttachment|filename|pagename|author|comment`
  * Example: `DelAttachment|song.wav|FrontPage|HansMustermann|testing`
 * `RenamePage|pagename|new pagename|author|comment`
  * Renames a pagename to a new pagename
