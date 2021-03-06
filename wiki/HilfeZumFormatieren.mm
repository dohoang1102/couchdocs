## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnFormatting
##master-date:2002-02-27 15:16:34
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language de
== Text-Formatierungsregeln ==

Lassen Sie eine Leerzeile zwischen Absätzen. Benutzen Sie {{{<<BR>>}}}, um einen harten Zeilenumbruch innerhalb eines Absatzes einzufügen.

Sie können Text ''kursiv'' oder '''fett''' schreiben.
Um kursiv zu schreiben, umgeben Sie den Text mit zwei einfachen Anführungszeichen.
Um fett zu schreiben, umgeben Sie den Text mit drei einfachen Anführungszeichen. Sie erhalten ^hochgestellten Text^, indem Sie den Text in {{{^}}}-Zeichen einschließen. 

Wenn Sie Programm-Quellcode in einer {{{nichtproportionalen Schriftart}}} einfügen wollen, ohne ihn umzuformatieren, verwenden Sie drei geschweifte Klammern auf verschiedenen Zeilen:
{{{
10 PRINT "Hallo Welt!"
20 GOTO 10
}}}

Befinden sich diese Markierungen auf der selben Zeile, wird der eingefasste Text lediglich in der {{{Schreibmaschinenschift}}} dargestellt, außerdem werden jegliche sonstige Formatierungszeichen ignoriert. Es gibt alternativ für diese eingebetteten `Computertexte` die Möglichkeit, ihn mit inversen Hochkommata zu umgeben.

Weitere Informationen über mögliche Formatierungen finden Sie in HilfeZumEditieren.

=== Beispiel ===
{{{
Mischen von ''kursiv'' und '''fett''':
 * '''''Mischen''' am Anfang''
 * '''''Mischen'' am Anfang'''
 * '''Mischen am ''Ende''''
 * ''Mischen am '''Ende'''''

Sie erinnern sich vielleicht an ''a''^2^ `+` ''b''^2^ `=` ''c''^2^ aus Ihren Mathematikstunden.

Eine { { {eingebettete Code-Sequenz} } } hat Anfang- und Ende-Markierung auf der gleichen Zeile. Oder Sie benutzen `inverse Hochkommata`.

Ein Programmlisting hat sie auf verschiedenen Zeilen: { { {
'''Keine''' Formatierungen hier!
} } }
}}} 
/!\ Im Beispiel oben haben wir die Auszeichnungen für die Programmcodesequenz dadurch ungültig gemacht ("escaped"), dass wir Leerzeichen zwischen den geschweiften Klammern eingefügt haben.

=== Anzeige ===
Mischen von ''kursiv'' und '''fett''':
 * '''''Mischen''' am Anfang''
 * '''''Mischen'' am Anfang'''
 * '''Mischen am ''Ende'''''
 * ''Mischen am '''Ende'''''

Sie erinnern sich vielleicht an ''a''^2^ `+` ''b''^2^ `=` ''c''^2^ aus Ihren Mathematikstunden.

Eine {{{eingebettete Code-Sequenz}}}  hat Anfang- und Ende-Markierung auf der gleichen Zeile. Oder Sie benutzen `inverse Hochkommata`.

Ein Programmlisting hat sie auf verschiedenen Zeilen: {{{
'''Keine''' Formatierungen hier!
}}}

=== Colorierte Programmcode-Anzeige ===
Es gibt mehrere Möglichkeiten, Code coloriert anzuzeigen<<FootNote( Siehe HelpOnParsers für weitere Beispiele.)>>:
 1. fangen Sie eine Programmcode-Anzeige mit einer Zeile an, die nur "#!python" enthält
 1. betten Sie einen Dateianhang mit "inline:" ein, der eine ".py"-Erweiterung hat
 1. fangen Sie eine Seite mit einer Python-Formatierungsanweisung an ("#format python")

Beispiel: {{{
#!python
from colors import palette
palette.colorize('python')
}}}
