## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnLinking
##master-date:2004-06-25 10:05:30
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language de

== Beliebige Seiten-Namen ==
Wenn Sie eine Folge von Zeichen in eckigen Klammern und doppelten Anführungszeichen {{{["wie hier"]}}} einschließen, dann wird daraus ein Seitenname. Dies kann für spezielle Anwendungen benutzt werden (z.B. für's Organisieren einer Liste von Dingen, z.B. Ihrer CD-Sammlung über deren "natürlichen" Namen) oder auch wenn Sie ein Wiki mit nicht-westlichen Zeichensätzen erzeugen wollen.

/!\ '''Dies ist eine konfigurierbare Eigenschaft, die durch `allow_extended_names` aktiviert wird, dadurch kann es sein, dass dies nicht ohne weiteres funktioniert!'''


== Verweise und eingebettete Bilder ==
Es gibt verschiedene Wege, um externe Referenzen<<FootNote(Das Gegenteil von externen Referenzen sind die internen, automatischen Verweise mittels WikiNamen.)>> in den Text einzufügen:
 * direktes Einfügen einer URL; wenn die URL mit einer Erweiterung für Bilddateien endet ("{{{.gif}}}", "{{{.jpg}}}" or "{{{.png}}}"), wird die URL in ein HTML-Bildelement konvertiert.
 * geklammerte URLs.
 * InterWiki-Verweise.
 * email-Adressen.

Wenn Sie URLs in normalen Text einfügen, ist es problematisch zu erkennen, was zu der URL gehört und was nicht. Es gibt vier Wege, das Ende einer URL zu erzwingen:
 * platzieren Sie ein Leerzeichen hinter die URL.
 * benutzen Sie die Wiki:SixSingleQuotes''''''-Methode (oder alternativ zwei inverse Hochkommata {{{``}}}).
 * geben Sie die URL in doppelten Anführungszeichen ein.
 * benutzen Sie die Klammer-URL-Syntax.

Folgende URL-Schemata werden unterstützt: `http`, `https`, `ftp`, `nntp`, `news`, `mailto`, `telnet` und `file`. Der Administrator Ihres Wikis kann die unterstützen Schemata erweitern, indem er die {{{config.url_schemas}}}-Variable benutzt (siehe HilfeZurKonfiguration).

Zusätzlich zu den Standard-Schemata gibt es auch noch MoinMoin-spezifische: `wiki`, `attachment`, `inline` und `drawing`. "`wiki`" weist einen InterWiki-Link aus,  `MoinMoin:FrontPage` und `wiki:MoinMoin:FrontPage` sind also gleichbedeutend; normalerweise werden Sie die kürzere Form bevorzugen, das "`wiki`"-Schema wird dann wichtig, wenn Sie geklammerte Links benutzen, weil Sie dort immer ein Schema benötigen. Die anderen Schemata beziehen sich auf Dateianhänge und werden auf HilfeZuAktionen/DateiAnhänge erklärt.

Wenn Sie die Konfigurations-Option `bang_meta` auf `true` setzen, können Sie die Verlinkung über WikiName``n unterdrücken, indem sie ein Ausrufezeichen (engl.: ''bang'') vor den WikiName``n schreiben, z.B. `!WikiName`. Dies ist standardmäßig abgeschaltet.

Weitere Informationen über mögliche Formatierungen finden Sie unter HilfeZumEditieren. Zu den Details, wie man auf Unterseiten verweist, siehe  HilfeZumEditieren/UnterSeiten.

Um Verweisanker in eine Seite ''einzufügen'' benötigen Sie den [wiki:HilfeZuMakros Makro] ''Anchor'': `<<Anchor(anchorname)>>`, wobei "anchorname" durch den korrekten Bezeichner des Ankers zu ersetzen ist. Um auf einen Anker auf der gleichen Seite zu verweisen, benutzen Sie `[#anchorname]` oder `[#anchorname Text der Beschreibung]`. Um einen Verweis auf einen Anker auf einer anderen Seite zu setzen schreiben Sie `[wiki:Self:SeitenName#anchorname]` oder `[wiki:Self:SeitenName#anchorname Text der Beschreibung]`, wobei "Seiten``Name" der Name der anderen Seite und "anchorname" der Bezeichner des Ankers auf dieser Seite ist.

<<FootNote>>
=== Beispiel ===
{{{
 * http://moin.sourceforge.net/
 * [http://moin.sourceforge.net/]
 * [http://moin.sourceforge.net/ MoinMoin-Homepage auf Sourceforge]
 * http://moin.sourceforge.net/moinmoin.gif
 * [http://moin.sourceforge.net/moinmoin.gif]
 * [http://moin.sourceforge.net/moinmoin.gif moinmoin.gif]
 * InterWiki
  * Self:InterWiki
  * MeatBall:InterWiki
  * wiki:MeatBall/InterWiki
  * [wiki:MeatBall/InterWiki]
  * [wiki:MeatBall/InterWiki InterWiki-Seite auf MeatBall]
 * jh@web.de
 * [#anchorname Verweis auf einen Anker auf dieser Seite]
 * [wiki:Self:OtherPage#anchorname Verweis auf Anker auf einer anderen Wiki-Seite]
}}} 

=== Anzeige ===
 * http://moin.sourceforge.net/
 * [http://moin.sourceforge.net/]
 * [http://moin.sourceforge.net/ MoinMoin-Homepage auf Sourceforge]
 * http://moin.sourceforge.net/moinmoin.gif
 * [http://moin.sourceforge.net/moinmoin.gif]
 * [http://moin.sourceforge.net/moinmoin.gif moinmoin.gif]
 * InterWiki
  * Self:InterWiki
  * MeatBall:InterWiki
  * wiki:MeatBall/InterWiki
  * [wiki:MeatBall/InterWiki]
  * [wiki:MeatBall/InterWiki InterWiki-Seite auf MeatBall]
 * jh@web.de
 * [#anchorname Verweis auf einen Anker auf dieser Seite]
 * [wiki:Self:OtherPage#anchorname Verweis auf Anker auf einer anderen Wiki-Seite]
