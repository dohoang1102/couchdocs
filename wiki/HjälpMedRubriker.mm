## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##translated-by:Karolina Lindqvist, Shakti Wiki
##master-page:HelpOnHeadlines
##master-date:2002-03-05 10:00:33
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sv
#pragma section-numbers on

== Rubriker för stycken ==
Du kan skapa rubriker genom att börja och sluta raden med upp till fem likhetstecken. Rubriktexten tas från det som finns mellan dessa markeringar, separarat med ett mellanslag.

Rubriker kan automatnumreras. Detta kan slås av och på för varje sida (se `#pragma section-numbers` i HjälpMedDirektiv ) eller för hela platsen (se `show_section_numbers` i HjälpMedAnpassning).

För mer information om olika märkkoder, se HjälpMedÄndringar.

=== Exempel ===
{{{
 = Rubrik =
 == Underrubrik ==
 === Underrubrik nivå 3 ===
 ==== Nivå 4 ====
 ===== Nivå 5 =====
}}} 

=== Hur det ser ut ===
 = Rubrik =
 == Underrubrik ==
 === Underrubrik nivå 3 ===
 ==== Nivå 4 ====
 ===== Nivå 5 =====

Observera att korrekt sektionsnumrering kräver att du ordnar sektionerna till en korrekt struktur. I vårt exempel är det inte gjort, så du får ett annorlunda rubrikschema än du kanske har förväntat dig.
