## Please edit system and help pages ONLY in the moinmaster wiki!
## For more information, please see MoinMaster:MoinPagesEditorGroup.
## Merci de n'éditer les pages systèmes et d'aide QUE sur MoinMaster !
## Pour plus d'information, consultez MoinMaster:MoinPagesEditorGroup.
##master-page:WikiSandBox
##master-date:2005-01-07 16:26:44
#format wiki
#language fr
Sentez-vous libre d'expérimenter ici, après les quatre tirets ci-dessous... Merci de ne '''PAS''' créer de nouvelles pages sans contenu utile juste pour essayer !

'''Astuce :''' ouvrez l'["AideDeL'Édition"] dans une seconde fenêtre en cliquant avec le bouton droit sur le lien au début de cette ligne.
----

== Mise en forme ==

''italique'' '''gras''' {{{chasse fixe}}}

`chasse fixe au moyen de contre-apostrophes` (configurable)

~+ plus gros +~ ~- plus petit -~

{{{
préformatté    plus de texte
encore plus de texte
}}}

{{{#!python
def syntaxe(mise_en_relief):
    print "activée"
    return None
}}}

{{{#!java
  public void main(String[] args]){
     System.out.println("Bonjour, Monde !");
  } 

}}}

== Liens ==

["AideDeL'Édition"] MoinMoin:InterWikiFr

http://moinmoin.wikiwikiweb.de/ [http://www.python.org/ Python]

quelqu.un@sur.inter.net

=== Lien vers une image ===
http://c2.com/sig/wiki.gif

== Frimousses ==

/!\ Attention

== Listes ==

 * première puce
   1. imbriquée et numérotée
   1. les lignes avec un numéro sont numérotées automatiquement
 * deuxième puce
 * troisième puce

 citation
   citation dans la citation

=== Glossaire ===
 Terme:: Définition

=== Dessins ===
drawing:un_essai

= Titre de niveau 1 =
== Titre de niveau 2 ==
=== Titre de niveau 3 ===
==== Titre de niveau 4 ====

= Essai de journal IRC =

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
(23:40) < ThomasWal> then this is no option awdsd asdasd sa asdasd sad asdadasds adasd asd asd asd asd asd a dadad ad adad ad asd asd adad asdasd asd adad as d
(23:40) <     jroes> yeah :/
}}}
