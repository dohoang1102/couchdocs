## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##translated-by:Karolina Lindqvist, Shakti Wiki
##master-page:HelpOnLinking
##master-date:2002-03-05 10:00:33
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sv
== URL:er och inbäddade bilder ==
Det finns flera olika sätt att infoga externa referenser <<FootNote(Motsatsen till externa referenser är interna automatiska WikiNamn-länkar.)>> i texten:
 * direkt insättning av `URL:er`. Om `URL:en` har filtyp som betecknar en bild ("{{{.gif}}}", "{{{.jpg}}}" eller "{{{.png}}}"), så visas den som en inbäddad bild istället för länk.
 * `URL:er` innanför hakparenteser
 * InterWiki-länkar
 * epostadresser

Om du skriver en `URL` i normal text så kan det bli ett problem att avgöra om det är en `URL` eller inte. Därför finns det fyra olika sätt att indikera att det är en `URL`:
 * sätt ett mellanslag efter `URL:en`.
 * använd undantagssekvensen SexCitationsTecken.
 * sätt `URL:en` innanför hakparenteser.

De godtagna URLschemorna är: `http`, `https`, `ftp`, `nntp`, `news`, `mailto`, `telnet` och `file`. Wikiadministratören för platsen kan lägga till fler `URL-scheman` genom att använda anpassningsvariabeln {{{config.url_schemas}}} (se HjälpMedAnpassning).

Förutom dessa standardscheman finns det också några MoinMoin-specifika: `wiki`, `attachment`, `inline` och `drawing`. "`wiki`" står för en InterWiki-länk, så `MoinMoin:FrontPage` och `wiki:MoinMoin:FrontPage` är ekvivalenta. Normalt använder man den kortare formen. "`wiki`"-schemat är viktigt när du använder länkar innanför hakparenteser, eftersom du alltid behöver ett URL-schema i det fallet. De andra tre URL-schemorna är för att bifoga filer och beskrivs i HjälpMedÅtgärder/BifogaFil.

Om anpassningsalternativet `bang_meta`är satt, så kan WikiNamn-länkning undvikas genom att sätta ett utropstecken (''bang'') före WikiNamn''''''et. ex. `!WikiNamn`. Detta alternativ är normalt avslaget.

För mer information om möjliga märkkoder, se HjälpMedÄndringar. För mer detailjer om hur du kan länka undersidor, se HjälpMedÄndringar/UnderSidor.

<<FootNote>>

=== Exempel ===
{{{
 * http://moin.sourceforge.net/
 * [http://moin.sourceforge.net/]
 * [http://moin.sourceforge.net/ MoinMoin Sourceforge Homepage]
 * http://moin.sourceforge.net/moinmoin.gif
 * [http://moin.sourceforge.net/moinmoin.gif]
 * [http://moin.sourceforge.net/moinmoin.gif moinmoin.gif]
 * InterWiki
  * Self:InterWiki
  * MeatBall:InterWiki
  * wiki:MeatBall/InterWiki
  * [wiki:MeatBall/InterWiki]
  * [wiki:MeatBall/InterWiki InterWiki''''''sida på MeatBall]
 * jh@web.de
 * [#anchorname Ankarlänk]
}}} 

=== Hur det ser ut ===
 * http://moin.sourceforge.net/
 * [http://moin.sourceforge.net/]
 * [http://moin.sourceforge.net/ MoinMoin Sourceforge Homepage]
 * http://moin.sourceforge.net/moinmoin.gif
 * [http://moin.sourceforge.net/moinmoin.gif]
 * [http://moin.sourceforge.net/moinmoin.gif moinmoin.gif]
 * InterWiki
  * Self:InterWiki
  * MeatBall:InterWiki
  * wiki:MeatBall/InterWiki
  * [wiki:MeatBall/InterWiki]
  * [wiki:MeatBall/InterWiki InterWiki''''''sida på MeatBall]
 * jh@web.de
 * [#anchorname Ankarlänk]
