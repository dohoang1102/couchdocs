## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnHeadlines
##master-date:2002-02-27 15:16:34
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language de
== Abschnittsüberschriften ==
Sie können Überschriften erzeugen, indem Sie eine Zeile mit bis zu fünf Gleichheitszeichen anfangen und enden lassen. Der Text der Überschrift wird zwischen diesen Markierungen platziert, links und rechts durch ein Leerzeichen abgetrennt.

Überschriften können automatisch numeriert werden - Sie können dies für jede Seite ein- oder ausschalten (siehe `#pragma section-numbers` auf HilfeZuVerarbeitungsAnweisungen) oder für das ganze Wiki (siehe `show_section_numbers` auf HilfeZurKonfiguration).

Weitere Informationen über mögliche Formatierungen finden Sie unter HilfeZumEditieren.

=== Beispiel ===
{{{
= Überschrift =
== Ebene 2 ==
=== Ebene 3 ===
==== Ebene 4 ====
===== Ebene 5 =====
}}} 

=== Anzeige ===
= Überschrift =
== Ebene 2 ==
=== Ebene 3 ===
==== Ebene 4 ====
===== Ebene 5 =====

Beachten Sie bitte, dass eine korrekte Abschnittsnumerierung erfordert, dass Sie die Abschnitte in einer gültigen Struktur anordnen, d.h. dass sie korrekt geschachtelt werden müssen. Unser Beispiel macht dies nicht, daher erhalten Sie eine andere Numerierung, als Sie vielleicht erwarten würden.
