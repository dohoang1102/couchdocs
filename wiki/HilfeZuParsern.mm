## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnParsers
##master-date:2004-12-02 09:00:00
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language de

<<TableOfContents>>

= Parser =

Ein Parser interpretiert den rohen Text einer Seite um daraus, über eine Serie von aufrufen des Formatierers, die Ausgabe zu erzeugen die der Benutzer wünscht. Meist ist dies HTML. MoinMoin hat zwei unterschiedliche Wege um den verwendten Parser zu wählen: einerseits die FORMAT Verarbeitungsanweisungen (siehe HilfeZuVerarbeitungsAnweisungen), andererseits sogenannte vorformatierte Bereiche (siehe HilfeZumEditieren).

Eine `#FORMAT` Verarbeitungsanweisung teilt MoinMoin mit welchen Parser es für die gesamte Seite verwenden soll. Der Standard ist der ''wiki'' parser. Beispiel: {{{#FORMAT cplusplus
... C++ Quelltext ...
}}}

Mit der Hilfe von vorformatierten Bereichen (Quelltextanzeige) ist es möglich einen Parser nur auf einen Teil einer Seite anzuwenden (früher war dies mit sogenannten Prozessoren möglich). Mit Hilfe eines Hash-Bang `#!` in der ersten Zeile der Region wird der Parser gewählt. Ein Hash-Bang Pfad in Shell-Skripten dient genau dem selben zweck: er wählt den Interpreter mit dem das Skript interpretiert werden soll. Beispiel: {{{
{ { {#!CSV
a,b,c
d,e,f
} } }
}}}

Lesen Sie auch HilfeZumFormatieren für mehr Informationen zum editieren von Seiten.

== ParserBase ==

!ParserBase stellt eine Basisklasse für Parser die Quelltext einfärben da, welche sehr einfach erweitert werden kann. Der HTML Formatierer stellt diese mit optional ein- und ausschaltbaren Zeilennummern da, wenn der Browser des Betrachters DOM und !JavaScript unterstützt.

Ein !ParserBase Einfärbeparser versteht die folgenden Argumente zu einer `#FORMAT` Verarbeitungsanweisung oder einer Hash-Bang Zeile. Diese werden einfach, durch Leerzeichen getrennt, hinter dem Namen des Parsers angegeben (`#FORMAT python start=10 step=10 numbering=on` oder `#!python numbering=off`).

 numbers:: sollen Zeilennummern angezeigt werden? Der Standard ist 'on'. Mögliche Werte: 'on', 'off' (keine Zeilennummern, aber !JavaScript falls möglich), 'disable' (überhauptkeine Zeilennummern)
 start:: Startzeilennummer (Standard: 1)
 step:: Inkrement der Zeilennummer (Standard: 1)

MoinMoin hat eine Hand voll Beispiel Quelltexteinfärbe Parser:

=== cplusplus ===

{{{#!cplusplus
int main(int argc, char **argv) {
  return 0;
}
}}}

=== java ===

{{{#!java
import java.util.Date;
import java.util.Calendar;

public class IntDate
{
  public static Date getDate(String year, String month, String day)
    {
      // Date(int, int, int) has been deprecated, so use Calendar to
      // set the year, month, and day.
      Calendar c = Calendar.getInstance();
      // Convert each argument to int.
      c.set(Integer.parseInt(year),Integer.parseInt(month),Integer.parseInt(day));
      return c.getTime();
    }
}
}}}

=== pascal ===

{{{#!pascal
function TRegEx.Match(const s:string):boolean;
var
    l,i : integer;
begin
    result := MatchPos(s,l,i);
end;
}}}

== python ==

Färbt Python Code ein. Dieser Parser ist nicht von !ParserBase abgeleitet, stellt aber die selben Argumente zur Verfügung:

{{{#!python
def hello():
    print "Hello World!"
}}}

<<Anchor(csvparser)>>
== CSV ==

Der CSV-Prozessor arbeitet mit sogenannten kommaseparierten Werten, wobei das Komma heutzutage üblicherweise ein Semikolon ist. Es wird davon ausgegangen, dass die erste Zeile die Titel der Spalten enthält; diese werden fett dargestellt. Wenn man keinen Tabellenkopf benötigt, kann man die erste Zeile leer lassen.

Der bang path kann ein oder mehrere "-index" Argumente enthalten, um die Darstellung bestimmter Spalten in der Ausgabe zu unterdrücken; die Spalten werden beginnend von 1 indiziert.

/!\ Der aktuelle CSV-Parser ist sehr schlicht.

MoinMoin Versionshistorie: {{{#!CSV -3
Version;Date;HIDDEN!
0.11;2002-03-11;Revision 1.151
0.10;2001-10-28;Revision 1.134
0.9;2001-05-07;
0.8;2001-01-23;
0.7;2000-12-06;
0.6;2000-12-04;
0.5;2000-11-17;
0.4;2000-11-01;
0.3;2000-10-25;
0.2;2000-08-26;
0.1;2000-07-29;
}}}

== reStructuredText ==

Der reStructuredText Parser ist Experimentell. Er funktioniert ganz gut, jedoch sind viele Elemente nicht unterstützt. Um hn zu verwenden ist die Installation des Python docutils Paketes notwendig, denn es stellt zusätzliche reStructuredText Funktionalität zur Verfügung, welche von MoinMoin benötigt wird.

=== Unterstützte Elemente ===

Emphasis, strong Emphasis, inline litteral, headers, bullet lists, enumerated lists, definition lists, field lists, literal blocks, and block quotes. (And perhaps others.)

=== Ununterstützte Elemente ===

Zeilen Blöcke, Tabellen, Direktiven, Referenzen aller Art, Fußnoten, etv.

=== Beispiel ===

{{{#!rst
This is a *very* simple example. If you see two asterisks around the word "very", in the previous sentence, then docutils is improperly installed (or not installed at all). When docutils is there, the word is displayed in italics, and this whole block of text is not displayed in a special source-code-like format, but as a normal part of the page.
}}}

=== Links ===

 * [http://docutils.sourceforge.net/docs/user/rst/quickref.html Quick reStructuredText] - als der ''reStructuredText Spickzettel'' bekannt
 * [http://docutils.sourceforge.net/ Die Docutils Homepage]
