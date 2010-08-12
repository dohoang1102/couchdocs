## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:WikiSandBox
#format wiki
#language en
Please feel free to experiment here, after the four dashes below... and please do '''NOT''' create new pages without any meaningful content just to try it out!

'''Tip:''' Shift-click "HelpOnEditing" to open a second window with the help pages.
----

== Formatting ==

''italic'' '''bold''' {{{typewriter}}} 

`backtick typewriter` (configurable)

~+ bigger +~ ~- smaller -~

{{{
preformatted some more
and some more lines too

}}}

{{{#!python
def syntax(highlight):
    print "on"
    return None
}}}


{{{#!java
  public void main(String[] args]){
     System.out.println("Hello world!");
  } 

}}}


== Linking ==

HelpOnEditing MoinMoin:InterWiki 

http://moinmoin.wikiwikiweb.de/ [http://www.python.org/ Python]

someone@the.inter.net


=== Image Link ===
http://c2.com/sig/wiki.gif

== Smileys ==

/!\ Alert

== Lists ==

=== Bullet ===
 * first
   1. nested and numbered
   1. numbered lists are renumbered
 * second
 * third
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
(23:40) <     jroes> yeah :/
}}}
