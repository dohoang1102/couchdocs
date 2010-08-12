## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:WikiSandBox
##master-date:2004-11-08 16:00:58
#format wiki
#language sr

== Formatiranje ==

Osećajte se slobodnim da eksperimentišete ovde, ispod četiri crtice dole... i molimo vas, '''NEMOJTE''' praviti nove stranice bez ikakovog značenja ili smisla samo da bi ste ih isprobali! Probajte slobodno sve živo ovde... 


'''Predlog:''' Otvorite link "PomoćZaObradu" u novom prozoru da biste videli dodatne informacije o obrađivanju stranica.
----

== Formatiranje ==

''italic'' '''bold''' {{{typewriter}}} 

`backtick typewriter` (configurable)

~+ bigger +~ ~- smaller -~

{{{
preformatted
}}}

{{{#!Colorize python
def syntax(highlight):
    print "on"
    return None
}}}

== Linking ==

HelpOnEditing MoinMoin:InterWiki 

http://purl.net/wiki/moin/ [http://www.python.org/ Python]

someone@the.inter.net


=== Image Link ===
http://c2.com/sig/wiki.gif

== Lists ==

=== Bullet ===
 * first
   1. nested and numbered
   1. numbered lists are renumbered
 * second
 * third
   mal sehen
 blockquote
   deeper

=== Glossary ===
 Term:: Definition

=== Drawing ===
drawing:mytest

= Heading 1 =
== Heading 2 ==
=== Heading 3 ===
==== Heading 4 ====
===== besonders gross =====

ПростоТест


= IRC Log test =

{{{#!irc
(23:18) <     jroes> ah
(23:19) <     jroes> hm, i like the way {{{ works, but i was hoping the lines would wrap
(23:21) -!- gpciceri [~gpciceri@host181-130.pool8248.interbusiness.it] has quit [Read error: 110 (Connection timed out)]
(23:36) < ThomasWal> you could also write a parser or processor
(23:38) <     jroes> i could?
(23:38) <     jroes> would that require modification on the moin end though?
(23:38) <     jroes> i cant change the wiki myself :x
(23:39) < ThomasWal> parsers and processors are plugable
(23:39) < ThomasWal> so you dont need to change the core code
(23:40) < ThomasWal> you need to copy it to the wiki data directory though
(23:40) <     jroes> well, what i meant to say was that i dont have access to the box running the wiki
(23:40) < ThomasWal> then this is no option
                     sad asdadasds adasd asd asd asd asd asd a dadad ad adad ad asd asd adad asdasd asd adad as d
(23:40) <     jroes> yeah :/
}}}
