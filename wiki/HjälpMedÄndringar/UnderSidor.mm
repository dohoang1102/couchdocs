## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##translated-by:Karolina Lindqvist, Shakti Wiki
##master-page:HelpOnEditing_2fSubPages
##master-date:2002-03-05 10:00:33
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sv
== Att skapa undersidor ==

Undersidor är grupper av sidor som har en gemensam huvudsida. Visserligen är detta också möjligt i klassis wiki, genom att använda namn som {{{NågotÄmneUnderÄmne}}}, men används istället {{{NågotÄmne/UnderÄmne}}} gör det lättare att navigera samt att man dessuom inte behöver skriva huvudsidans namn när man länkar från en undersida.

Således, genom att använda "/" för att sätta samman flera WikiNamn kan man skapa godtyckligt djupa hierarkier (begränsat av hur långa filnamn kan vara på systemet). I praktiken är undersidor vanliga sidor som har ett "/" i sitt namn och kan därför sparas på normalt sätt som alla andra sidor. Undersidor är ett inställningsbart alternativ, men är normalt tillåtet och det rekommenderas att det är det eftersom vissa av hjälpsidorna använder den funktionen.

=== Exempel ===
{{{
 * HjälpMedÄndringar/UnderSidor
 * [wiki:HjälpMedÄndringar/UnderSidor Den här sidan]
 * [wiki:Self:HjälpMedÄndringar/UnderSidor Den här sidan]
 * /TredjeNivån
 * [wiki:/TredjeNivån en undersida till den här sidan]
}}} 

=== Hur det ser ut ===
 * HjälpMedÄndringar/UnderSidor
 * [wiki:HjälpMedÄndringar/UnderSidor Den här sidan]
 * [wiki:Self:HjälpMedÄndringar/Undersidor Den här sidan]
 * /TredjeNivån
 * [wiki:/TredjeNivån en undersida till den här sidan]

 /!\ Obs, var vänlig och skapa inte sidan /TredjeNivån. Den är avsiktligt frånvarande.
