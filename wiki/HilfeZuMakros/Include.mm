## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnMacros/Include
##master-date:2003-10-11 18:35:26
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language de
<<Navigation(siblings)>>

Dieses Makro fügt den formatierten Inhalt der angegebenen Seite(n) ein und macht dabei ggf. auch rekursive Include-Aufrufe. Wenn die Rekursion einen Zyklus generieren würde, wird dies bemerkt und verhindert!

'''Benutzung:'''
 {{{
<<Include(pagename, heading, level, from="regex", to="regex", sort=ascending|descending, items=n, skipitems=n, titlesonly, editlink)>>
}}}

 pagename:: Name der Seite, die eingefügt werden soll - wenn er mit einem "`^`" anfängt, ein regulärer Ausdruck von Seiten, die eingefügt werden sollen.
 heading::  Text für die generierte Überschrift (optional).
 level::    Ebene (1-5) der generierten Überschriften (optional).
 from::     Start-Markierung für teilweises Einlesen (optional).
 to::       End-Markierung für teilweises Einlesen (optional).
 sort::     Sortierreihenfolge, wenn `pagename` ein regulärer Ausdruck ist, also mit einem "`^`" anfängt (optional).
 items::    Maximale Anzahl der einzufügenden Seiten (optional).
 skipitems:: Anzahl der vom Start her zu überspringenden Seiten (optional).
 titlesonly:: Nur einen Link zur Seite einfügen, keinen Seiteninhalt (optional).
 editlink:: Fügt einen Footer mit Verweis auf die einzufügende Seite hinzu, als auch einen Verweis, um die Seite zu bearbeiten (optional, benötigt MoinMoin 1.3.4).

Alle Parameter außer pagename sind optional, Sie müssen aber die angegebene Reihenfolge einhalten! Wenn Sie "`heading`" auslassen wollen, müssen Sie den zweiten Parameter leer lassen.

'''Beispiele:'''
 * `<<Include(FooBar)>>` -- fügt den Text der Seite `FooBar` in den aktuellen Absatz ein
 * `<<Include(FooBar, )>>` -- hinzufügen einer H1 namens 'Foo Bar' gefolgt vom Text
 * `<<Include(FooBar, , 2)>>` -- hinzufügen einer H2 namens 'Foo Bar'
 * `<<Include(FooBar, 'Alles über Foo Bar', 2)>>` -- hinzufügen einer H2 namens 'Alles über Foo Bar'
 * `<<Include(FooBar, , from="^----$")>>` -- nur den Inhalt nach dem ersten Horizontaltrenner einfügen
 * `<<Include(FooBar, , to="^----$")>>` -- nur den Inhalt bis zum ersten Horizontaltrenner einfügen
 * `<<Include(^FooBar/.*, , sort=descending)>>` -- die Seitenliste absteigend sortieren
 * `<<Include(^FooBar/.*, , items=3)>>` -- maximal drei Seiten einfügen
 * `<<Include(^BlogBase/.*,, to="^----$", sort=descending, items=7)>>` -- Anzeigen maximal einer Woche eines Blogs
 * `<<Include(^BlogBase/.*,, to="^----$", sort=descending, items=7, skipitems=7, titlesonly)>>` -- nur die Titel der vorhergehenden Woche anzeigen
 * Sie können dies mit MoinMoin:MonthCalendar zum sog. ''Blogging'' benutzen:
  * `<<Include(^FirstnameLastname/20..-..-..,,to="^----",sort=descending,items=3)>>` -- 3 Einträge eines Monatskalenders anzeigen
  * `<<Include(^FirstnameLastname/20..-..-..,,to="^----",sort=descending,items=4,skipitems=3,titlesonly)>>` -- die nächsten 4 Einträge nur mit Titeln anzeigen
