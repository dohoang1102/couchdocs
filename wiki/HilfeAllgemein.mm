## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpMiscellaneous
##master-date:2004-07-23 11:19:16
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language de

= Andere MoinMoin-Hilfethemen =

'''Unterthemen'''
 * /FragenUndAntworten

'''Inhalt''' <<TableOfContents>>

== Deutsche Seiten zum Thema Wikis ==

Folgende Verweise führen zu Seiten, die weitere Informationen zum Thema Wikis in deutscher Sprache enthalten:
 * Wiki:WikiInEinerMinute
 * [wiki:DseWiki:StartSeite DseWiki]: DseWiki:WikiInEinerMinute, DseWiki:WarumWiki, DseWiki:WikiQuizz

== Besondere Features für Wiki-Farmen und Intranets ==

Die folgende Anleitung zeigt, wie Sie Ihre Konfiguration optimieren, so dass Sie mehrere Wikis auf einem Rechner laufen lassen oder MoinMoin in einem Intranet einsetzen können.

=== Zentralisierte Einstellungen ===

 * farmconfig.py
 * gemeinsame intermap.txt
 * gemeinsame Codebasis und Icons

=== URLs umleiten ===

Die Konfigurationsvariable "`url_mappings`" kann hierfür verwendet werden. Dies ist eine Tabelle von URL-Präfixen (ein `dict` von {{{'Präfix':'Ersetzung'}}}). URLs umzuleiten hilft besonders in Intranets, in denen ganze Bäume von extern untergebrachten Dokumenten verschoben werden.

'''Bitte beachten:''' Wenn Sie von einer einzelnen Seite einfach auf eine andere ''weiterleiten'' wollen, geben Sie bitte `#REDIRECT` und den Namen der Seite, auf die weitergeleitet werden soll in die erste Zeile der Seite ein. Vgl. HilfeZuVerarbeitungsAnweisungen.

== TODO ==

<!> TODO: Do TODO (-:
