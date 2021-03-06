## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnLinking
##master-date:2004-10-24 12:13:54
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language da
== Arbitrære sidenavne ==
Hvis du omkranser en række bogstaver i lodrette klammer og dobbelte anførselstegn {{{["lissom dette"]}}}, bliver det til et sidenavn. Dette kan bruges til specielle anvendelser af MoinMoin (såsom organisering af lister af ting, f.eks. din CD-samling, ved deres "naturlige" navn).

/!\ Dette er en opsætningsindstilling aktiveret med `allow_extended_names`, så det fungerer muligvis ikke!

== URL'er og integrerede billeder ==
Der er flere måder at indsætte eksterne henvisninger<<FootNote(Det modsatte af eksterne henvisninger er interne, automatiske WikiNavn henvisninger)>> til teksten:
 * direkte indsættelse af URL'er; hvis adressen ender med fil-endelsen for et billede ("{{{.gif}}}", "{{{.jpg}}}" eller "{{{.png}}}"), bliver URL'en omdannet til et billedemærke.
 * URL'er i lodrette klammer.
 * InterWiki henvisninger.
 * email-adresser.

Indtaster du URL'er inde i normal tekst er der problemet med at genkende hvad der hører til URL'en og hvad der ikke gør. Der er fire måder at tvinge afslutning af en URL:
 * tilføj et mellemrum efter URL'en.
 * brug Wiki:SixSingleQuotes undvigelsesmetoden.
 * omkrans URL'en af dobbelte anførselstegn.
 * brug syntaksen med lodrette klammer.

De understøttede URL-skemaer er: `http`, `https`, `ftp`, `nntp`, `news`, `mailto`, `telnet`, og `file`. Administratoren af din wiki kan udvide med flere skemaer med {{{url_schemas}}}-variablen (se HelpOnConfiguration).

Oveni standardskemaerne er der de MoinMoin-specifikke: `wiki`, `attachment`, `inline`, and `drawing`. "`wiki`" indikerer en InterWiki henvisning, så `MoinMoin:ForSide` og `wiki:MoinMoin:ForSide` er det samme; normalt vil du bruge den kortere form; "`wiki`"-skemaet bliver vigtigt når du bruger syntaksen med lodrette klammer, da du her altid skal angive et skema. De øvrige tre skemaer er relateret til vedhæftede filer og gennegås under HelpOnActions/AttachFile.

Når opsætningsindstillingen `bang_meta` er aktiveret, kan du undertrykke WikiNavn-henvisninger ved at tilføje et udråbstegn (''bang'') foran WikiNavn''''''et, som i `!WikiNavn`. Dette er slået fra som standard.

Se HjælpTilRedigering for yderligere information om mulig opmærkning. For detaljer om henvisninger til undersider se HelpOnEditing/SubPages.

For at ''indsætte'' ankre på en side skal du bruge [wiki:HelpOnMacros macro]en ''Anchor'': `<<Anchor(ankernavn)>>`, hvor "ankernavn" er ankerets rigtige adresse. for at henvise en anker til samme wikiside bruges `[#ankernavn]` eller `[#ankernavn mærkattekst]`. For at henvise til et anker på en anden wikiside skrives `[wiki:Self:SideNavn#ankernavn]` eller `[wiki:Self:SideNavn#ankernavn mærkattekst]`, hvor "Side``Navn" er navnet på den anden side og "ankernavn" er referencen til ankeret på siden.

Det er ofte ønskværdigt at oprette en henvisning til en wikiside i den nuværende wiki, men at henvisningen fremtræder med en anden mærkat. Du kan bruge en InterWiki henvinsing med wikinavnet "Self", men så tilknyttes InterWiki-ikonet som kan være være misvisende da du slet ikke henviser til en ekstern side. Brug syntaksen `[:WikiSide:Mærkattekst]` for at få en henvisning til en wikiside i denne wiki uden at skabe en InterWiki-henvisning.

<<FootNote>>

=== Eksempel ===
{{{
 * http://moin.sourceforge.net/
 * [http://moin.sourceforge.net/]
 * [http://moin.sourceforge.net/ MoinMoin Sourceforge Hjemmeside]
 * http://moin.sourceforge.net/moinmoin.gif
 * [http://moin.sourceforge.net/moinmoin.gif]
 * [http://moin.sourceforge.net/moinmoin.gif moinmoin.gif]
 * InterWiki
  * Self:InterWiki
  * MeatBall:InterWiki
  * wiki:MeatBall/InterWiki
  * [wiki:MeatBall/InterWiki]
  * [wiki:MeatBall/InterWiki InterWiki-side på MeatBall]
 * jh@web.de
 * [:InterWiki:InterWiki-side i denne wiki]
 * [#ankernavn Henvisning til anker på denne side]
 * [wiki:Self:AndenSide#ankernavn Henvisning til anker på en anden wikiside]
 * [:AndenSide#ankernavn:Henvisning til side på denne wiki med mærkattekst]}}}

=== Display ===
 * http://moin.sourceforge.net/
 * [http://moin.sourceforge.net/]
 * [http://moin.sourceforge.net/ MoinMoin Sourceforge Hjemmeside]
 * http://moin.sourceforge.net/moinmoin.gif
 * [http://moin.sourceforge.net/moinmoin.gif]
 * [http://moin.sourceforge.net/moinmoin.gif moinmoin.gif]
 * InterWiki
  * Self:InterWiki
  * MeatBall:InterWiki
  * wiki:MeatBall/InterWiki
  * [wiki:MeatBall/InterWiki]
  * [wiki:MeatBall/InterWiki InterWiki-side på MeatBall]
 * jh@web.de
 * [:InterWiki:InterWiki-side i denne wiki]
 * [#ankernavn Henvisning til anker på denne side]
 * [wiki:Self:AndenSide#ankernavn Henvisning til anker på en anden wikiside]
 * [:AndenSide#ankernavn:Henvisning til side på denne wiki med mærkattekst]}}}
