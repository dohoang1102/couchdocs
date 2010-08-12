## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl -All:write Default
#format wiki
#language en
The dictionary markup can be used to store key-value pairs like in a dictionary or glossary. It uses definition lists (see HelpOnLists). A dictionary page used by the system has to have a name ending with `Dict` (see `page_dict_regex` on the page HelpOnConfiguration).

Dictionaries can be either shared or private (only you have read access to them under your homepage).

== How does it look? ==
This is an example:
 var1:: value1
 var2:: value2
 var3:: value3

And it looks like this in the page source:
{{{
 var1:: value1
 var2:: value2
 var3:: value3
}}}
 /!\ The leading space and the space after '::' are important.

See also HelpOnVariables

== Dictionaries for translations ==
Dictionaries can be used to translate user-specified words with auto-substitution<<FootNote(this is an alternative for the distributed PO-Files, which are used instead in MoinMaster wiki)>>. If you want to use that a dictionary has to be named in the form ''Language''Dict (examples: !GermanDict, !FrenchDict, !SpanishDict, etc.).
----
