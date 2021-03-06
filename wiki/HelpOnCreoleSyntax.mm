## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl -All:write Default
#format text/creole
#language en

<<HelpForUsers>> > <<HelpOnEditing>> > <<HelpOnProcessingInstructions>> > HelpOnCreoleSyntax

**Creole** <<FootNote(http://www.wikicreole.org/)>> is a new wiki markup language - its goal is to become the one common wiki syntax and enable better exchange of content between different wiki engines.

This page introduces you to the most important elements of the creole syntax, showing first the markup verbatim and then how it is rendered by the wiki engine. Please note that some of the features depend on your configuration.

  //BTW: This very page is written in creole syntax!//

= Table of Contents =
{{{
**Contents** (up to the 2nd level)
<<TableOfContents(2)>>
}}}
**Contents** (up to the 2nd level)
<<TableOfContents(2)>>


= Headings =
{{{
= heading 1st level =
== heading 2nd level ==
=== heading 3rd level ===
==== heading 4th level ====
===== heading 5th level =====
}}}
= heading 1st level =
== heading 2nd level ==
=== heading 3rd level ===
==== heading 4th level ====
===== heading 5th level =====


= Text Formatting =
{{{
* //emphasized (italics)//
* **boldface**
* **//bold italics//**, //**italics bold**//
* {{{monospace}}}
}}}
* //emphasized (italics)//
* **boldface**
* **//bold italics//**, //**italics bold**//
* {{{monospace}}}


= Hyperlinks =
== Internal Links ==
{{{
* <<FrontPage>>
* <<HelpOnEditing/SubPages>>
* <</SubPage>>
* <<../SiblingPage>>
* <<FrontPage|named link>>
* <<#anchorname>>
* <<#anchorname|description>>
* <<PageName#anchorname>>
* <<PageName#anchorname|description>>
* <<attachment:filename.txt>>
}}}
* <<FrontPage>>
* <<HelpOnEditing/SubPages>>
* <</SubPage>>
* <<../SiblingPage>>
* <<FrontPage|named link>>
* <<#anchorname>>
* <<#anchorname|description>>
* <<PageName#anchorname>>
* <<PageName#anchorname|description>>
* <<attachment:filename.txt>>

== External Links ==
{{{
* http://moinmo.in/
* <<http://moinmo.in/>>
* <<http://moinmo.in/|MoinMoin Wiki>>
* <<http://static.moinmo.in/logos/moinmoin.png>>
* {{http://static.moinmo.in/logos/moinmoin.png}}
* <<http://static.moinmo.in/logos/moinmoin.png|moinmoin.png>>
* <<MeatBall:InterWiki|InterWiki page on MeatBall>>
* <<file://///servername/share/full/path/to/file/filename%20with%20spaces.txt|link to file filename with spaces.txt>>
* <<mailto:user@example.com>>
}}}

* http://moinmo.in/
* <<http://moinmo.in/>>
* <<http://moinmo.in/|MoinMoin Wiki>>
* <<http://static.moinmo.in/logos/moinmoin.png>>
* {{http://static.moinmo.in/logos/moinmoin.png}}
* <<http://static.moinmo.in/logos/moinmoin.png|moinmoin.png>>
* <<MeatBall:InterWiki|InterWiki page on MeatBall>>
* <<file://///servername/share/full/path/to/file/filename%20with%20spaces.txt|link to file filename with spaces.txt>>
* <<mailto:user@example.com>>

== Avoid or Limit Automatic Linking ==
{{{
 * {{{http://www.example.com}}}
 * ~http://www.example.com/
}}}
 * {{{http://www.example.com}}}
 * ~http://www.example.com/


= Drawings =
{{{
{{drawing:myexample}}
}}}

{{drawing:myexample}}


= Lists =
== Unordered Lists ==
{{{
* item 1

* item 2 (preceding white space)
** item 2.1
*** item 2.1.1
* item 3
}}}

* item 1

* item 2 (preceding white space)
** item 2.1
*** item 2.1.1
* item 3

== Ordered Lists ==
{{{
# item 1
## item 1.1
## item 1.2
# item 2
}}}

# item 1
## item 1.1
## item 1.2
# item 2


= Horizontal Rule =
{{{
----
}}}
----


= Tables =
{{{
|=A |=B |=C |
| 1 | 2 | 3 |
}}}
|=A |=B |=C |
| 1 | 2 | 3 |

= Other =
{{{
forced\\linebreak
}}}
forced\\linebreak


= Macros and Variables =
== Macros ==
* {{{<<Anchor(anchorname)>>}}} inserts a link anchor {{{anchorname}}}
* {{{<<BR>>}}} inserts a hard line break
* {{{<<FootNote(Note)>>}}} inserts a footnote saying {{{Note}}}
* {{{<<Include(HelpOnMacros/Include)>>}}} inserts the contents of the page {{{HelpOnMacros/Include}}} inline
* {{{<<MailTo(user AT example DOT com)>>}}} obfuscates the email address {{{user@example.com}}} to users not logged in

== Variables ==
 * ~@SIG~@ inserts your login name and timestamp of modification
 * ~@TIME~@ inserts date and time of modification


= Parsers =
== Verbatim Display ==
{{{
{{{
def hello():
    print "Hello World!"
~}}}
}}}

{{{
def hello():
    print "Hello World!"
}}}

== Syntax Highlighting ==
{{{
{{{
#!python
def hello():
    print "Hello World!"
~}}}
}}}

{{{
#!python
def hello():
    print "Hello World!"
}}}
----
See also <<http://www.wikicreole.org/attach/CheatSheet/creole_cheat_sheet.png|CreoleCheatCheet>> (PNG image)
----
