## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##translated-by:Karolina Lindqvist, Shakti Wiki
##master-page:HelpOnPageCreation
##master-date:2002-05-10 10:00:43
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sv
== Att skapa en ny sida ==

För att skapa en ny sida, skriv sidans WikiNamn på en redan existerande sida och spara den. Sedan kan du klicka på referensen till den nya sidan, då den nu har blivit en hyperlänk.

Du presenteras då med en blank sidan som du kan redigera på normalt sätt. Först när du sparar den så skapas den automatiskt. Sidor kan normalt <<FootNote(Radering av sidor kan aktiveras av wiki-administratören (vilket normalt görs endast på IntraNätplatser.).)>> inte tas bort, så se till att du stavar nya WikiNamn korrekt.

För att få hjälp med att skapa länkar till undersidor, se HjälpMedÄndringar/UnderSidor.

<<FootNote>>

== Skapandet av en mallsida ==
För att skapa en sidmall, följ ovanstående beskrivning och använd ett sidnamn som slutar med "'''Mall'''". Den sidan kommer sedan att läggas till sidan med mallsidor som visas när du försöker titta på en ickeexisterande sida. Till exempel, IckeExisterandeHjälpSidan har en länk till HjälpMall som laddar innehållet av HjälpMall i redigeringsrutan när du klickar på den länken.

== Variabelsubstitution när man sparar en sida ==

Följande variabler ersätts när en sida ''slutgiltigen'' sparas. Observera att de fortfarande visas oersatta i förhandsgranskningen.


|| @''''''PAGE@     || Sidans namn (användbart för mallsidor) ||
|| @''''''DATE@     || Datum i systemets format ||
|| @''''''TIME@     || Tid och datum i användarens format ||
|| @''''''USERNAME@ || Användarens namn (eller domän/IP) ||
|| @''''''USER@     || Signatur "-- inloggningsnamn" ||
|| @''''''SIG@      || Daterad signatur "-- inloggningsnamn datum tid" ||
|| @''''''MAILTO@   || En finare mailto: länk med användarens data ||


Observera att sparande av mallsidor ''inte'' expanderar variabler. Förutom detta är variabelsubstitutioner globala och sker varhelst på sidan de finns, även inom källkodssegment, kommentarer, formatinstruktioner och andra "speciella" delar av sidan som man kan tycka ska exkluderas.
