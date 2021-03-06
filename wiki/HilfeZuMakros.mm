## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnMacros
##master-date:
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language de
<<Navigation(children)>>
<<TableOfContents>>

== Makros ==
Makros erlauben das Einfügen von System-Eigenschaften in normale Wiki-Seiten; das Einzige, was solche Seiten auszeichnet, ist, dass sie Makros enthalten. Wenn Sie Seiten wie AktuelleÄnderungen oder SystemInfo editieren, sehen Sie, was das bedeutet.

Weitere Informationen über mögliche Formatierungen finden Sie unter HilfeZumEditieren.

=== Such-Makros ===
||'''Makro'''||'''Beschreibung'''||'''Beispiel'''||
||{{{<<TitleSearch>>}}}     || durchsucht die Seitentitel  || siehe die SeiteFinden-Seite ||
||{{{<<FullSearch>>}}}      || durchsucht den Seiteninhalt || siehe die SeiteFinden-Seite ||
||{{{<<FullSearch()>>}}}    || sucht den aktuellen Titel in allen Seiten (wie wenn Sie auf den Seitentitel klicken) || siehe die CategoryCategory-Seite ||
||{{{<<FullSearch('text')>>}}} || sucht nach "text" auf allen Seiten || suche nach  {{{FullSearch}}}:<<FullSearch('FullSearch')>> ||
||{{{<<GoTo>>}}}            || springe direkt zur eingegebenen Seite || siehe die  SeiteFinden-Seite ||
||{{{<<PageList(regex:text)>>}}} || auflisten von Seiten, deren Titel auf die regex text passen || siehe den HilfeIndex ||

=== Navigation ===
||'''Makro'''||'''Beschreibung'''||'''Beispiel'''||
||{{{<<RecentChanges>>}}}   || Liste der vor kurzem editierten Seiten || siehe AktuelleÄnderungen ||
||{{{<<TitleIndex>>}}}      || Index aller Seitentitel || siehe TitelIndex ||
||{{{<<WordIndex>>}}}       || Index aller Worte in Seitentiteln || siehe WortIndex ||
||{{{<<WantedPages>>}}}     || Liste von Verweisen auf nicht-existente Seiten || Siehe GesuchteSeiten ||
||{{{<<OrphanedPages>>}}}   || Seiten auflisten, auf die keine andere Seite verweist || Siehe VerwaisteSeiten ||
||{{{<<AbandonedPages>>}}}  || Seiten auflisten, die am längsten nicht mehr editiert worden sind || Siehe AufgegebeneSeiten ||
||{{{<<RandomPage>>}}}      || ein Link zu einer zufälligen Seite || <<RandomPage>> ||
||{{{<<RandomPage(#)>>}}}   || Links zu einer Anzahl von zufälligen Seiten || Zwei zufällige Seiten: <<RandomPage(2)>> ||
||{{{<<TableOfContents([maxTiefe])>>}}} || zeigt ein lokales Inhaltsverzeichnis an, optional begrenzt bis zu einer maximalen Tiefe || siehe oben ||
||{{{<<Anchor(anchorname)>>}}} || Makro, um einen Anker in eine Seite einzufügen || <<Anchor(hier)>>[#hier] ||
||{{{<<Navigation(children[,maxdepth])>>}}} || Makro, um alle Unterseiten einer Seite aufzulisten || Siehe Anfang dieser Seite ||
||{{{<<Navigation(siblings[,maxdepth])>>}}} || Makro, um schnell zwischen benachbarten Unterseiten zu wechseln || Siehe /MailTo ||
||{{{<<Navigation(slideshow)>>}}} || Makro, um zwischen Diashow- und Wiki-Modus zu wechseln || Siehe HilfeZuDiaShow ||
||{{{<<Navigation(slides)>>}}} || Makro, um ein Kontrollfeld mit "Anfang/Vorgänger/Nachfolger/Ende" für Diashows anzuzeigen || Siehe HilfeZuDiaShow ||

=== System-Informationen ===
||'''Makro'''||'''Beschreibung'''||'''Beispiel'''||
||{{{<<InterWiki>>}}}       || eine Liste aller bekannten InterWiki-Namen || InterWiki ||
||{{{<<SystemInfo>>}}}      || Info über das Wiki, den Python-Interpreter und das Host-System || SystemInfo ||
||{{{<<PageCount>>}}}       || aktuelle Seitenanzahl || <<PageCount>> Seiten ||
||{{{<<PageSize>>}}}        || auflisten der Seitengrößen aller Seiten || Siehe SeitenGröße ||
||{{{<<StatsChart(Typ)>>}}} || Statistische Grafiken anzeigen (derzeit definierte Typen: hitcounts, pagesize, useragents) || Siehe EventStats und Unterseiten ||
||{{{<<SystemAdmin>>}}} || Web-Interface zur Wiki-Administration (in Version 1.1 noch unvollständig) || Siehe SystemInfo ||

=== Andere ===
||'''Makro'''||'''Beschreibung'''||'''Beispiel'''||
||{{{<<Icon(image)>>}}}     || Anzeigen der System-Icons || HilfeZurNavigation ||
||{{{<<UserPreferences>>}}} || Anzeigen der Benutzereinstellungen || BenutzerEinstellungen ||
||{{{<<BR>>}}} || einen harten Zeilenumbruch einfügen|| erste Zeile<<BR>>zweite Zeile ||
||{{{<<RandomQuote(Seitenname)>>}}} || Wählt ein zufälliges Zitat aus der angegebenen Seite aus; falls keine Seite angegeben wurde, wird die Seite `FortuneCookies` benutzt || <<RandomQuote>> ||
||{{{<<Include(HalloWelt[,heading[,level>>)>>}}} || Einfügen des Inhalts einer anderen Seite || Details auf ["/Include"] ||
||{{{<<FootNote(Text)>>}}} || Fußnote hinzufügen (der Text darf keine Wiki-Notation enthalten) oder gesammelte Fußnoten anzeigen, wenn keine Argumente angegeben werden || Siehe HilfeZurSeitenErzeugung ||
||{{{<<Date(timestamp)>>}}} || Anzeigen eines Datums-Stempels gemäß den Systemeinstellungen || <<Date()>> ||
||{{{<<DateTime(timestamp)>>}}} || Anzeigen eines Datums/Zeit-Stempels<<FootNote("timestamp" kann leer sein (aktuelle Zeit), die Sekundenzahl seit 1970 (Unix-timestamp) oder eine W3C-Zeitspezifikation ("2002-01-23T12:34:56").)>> gemäß den BenutzerEinstellungen || <<DateTime()>> ||
||{{{<<GetText(Text)>>}}} || lädt I18N-Texte (primär gedacht für die Benutzung auf Hilfeseiten) || "Edit``Text" wird übersetzt zu <<GetText(EditText)>>" ||
||{{{<<TeudView>>}}} || nützlich für Intranet-Entwickler-Wikis; eine Mittel pydoc-Dokumentation anzuzeigen, formatiert über ein XSLT-Stylesheet, für Details siehe EfnetPythonWiki:TeudProject || Siehe EfnetPythonWiki:TeudViewer?module=MoinMoin.macro.TeudView ||
||{{{<<MailTo(email)>>}}} || schützt Ihre E-Mail-Adresse vor Adress-Sammel-Robotern || Details siehe /MailTo ||

<<FootNote>>

== Beispiel-Anzeige ==
Wir zeigen hier nicht Beispiele für alle Makros, weil das diese Seite sehr lange machen würde. Hier ist der Ersatztext für das {{{<<SystemInfo>>}}}-Makro:
 <<SystemInfo>>
