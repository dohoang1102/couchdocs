## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##translated-by:Karolina Lindqvist, Shakti Wiki
##master-page:HelpOnConfiguration
##master-date:2002-05-11 10:00:33
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sv

/!\ This page is obsolete. Please look at HelpOnConfiguration

HjälpInnehåll > HjälpMedAdministration > HjälpMedAnpassning

'''Underämnen'''
 * SäkerhetsPolicy
 * /EpostStöd

'''Innehåll'''
<<TableOfContents>>

== Anpassning av MoinMoin ==

MoinMoin anpassas genom att ändra filen `moin_config.py`, vilken normalt kan finnas tillammans med `moin.cgi`-skripten. `moin_config.py` importeras av MoinMoin-huvudkoden tidigt i uppstarten och kan hittas eftersom arbetskatalogen (den med `moin.cgi`) är inkluderad i Pythons systemsökväg. Följdaktligen kan `moin_config.py` finnas varsomehslt i sökvägen `PYTHONPATH`.

=== Översikt över valbara anpassningar ===

Följande tabell ger förvalda värden och en kort beskrivning av de valbara variablerna. De flesta kan lämnas med sina förvalda värden. De som kan behöva ändras i varje installation är listade i exempelversionen av `moin_config.py`, som kommer med distributionen.


||<rowbgcolor="#FFFFE8"> '''Variabelnamn''' || '''Normalvärde''' || '''Beskrivning''' ||
|| Log''''''Store || 'text:editlog' || ''Experimentell, ändra inte'' ||
|| Security''''''Policy || None || objektklass för implementering av säkerhetsrestriktioner ||
|| allow_extended_names || 1 || ''true'' för att slå på {{{["icke-standard wikinamn"]}}} i märkspråket ||
|| allow_subpages || 1 || ''true'' för att välja hierarkiska wikifunktioner (se HjälpMedÄndringar/UnderSidor) ||
|| allow_numeric_entities || 1 || ''true'' för att sätta att numeriska objekt som `&#8364;` för &#8364; inte ska undantas, men &amp; etc fortfarande ska ||
|| allow_xslt || 0|| ''true'' för att tillåta XSLT-hantering via 4Suite (obs att om detta tillval är på så tillåter det vem som helst med lite 'know-how' att inklkudera HTML-kod i din viki, varför den normalt är avslagen) ||
|| allowed_actions || [] || tillåt osäkra direktiv (lista med strängar) ||
|| attachments || None || If {{{None}}}, sänd bifogade filer via CGI. Annars ger tillvalet namnet på den filkatalog som innehåller filbifogningar (nyckel ''dir'') och den ekvivalenta URL-förändelse till denna katalog (nyckel ''url'')||
|| backtick_meta || 1 || ''true'' för att tillåta {{{`inline literal`}}} i märkspråket ||
|| bang_meta || 0 || ''true'' för att tillåta {{{!IngetWikiNamn}}} i märkspråket ||
|| changed_time_fmt || '&nbsp; [%H:%M]' || Tidsformat som används i <<GetText(LatestChanges)>> för sidor redigerade inom 24 timmar ||
|| charset || 'iso-8859-1' || Teckensättet som ska användas på systemet ||
|| check_i18n || 0 || Sätt till 1 endast på ett utvecklingssystem eller på en översättares system ||
|| css_url || '/wiki-moinmoin/default.css' || URL för de förvalda CSS-definitionerna. Gör denna en server-realtiv URL (börja med /) ||
|| data_dir || './data/' || Sökväg till datafilkatalogen. Förvalet är OK om du har datafilkatalogen på samma ställe som `moin.cgi` ||
|| date_fmt || '%Y-%m-%d' || Systemdatumformat. Används huvudsakligen i <<GetText(LatestChanges)>> ||
|| datetime_fmt || '%Y-%m-%d %H:%M:%S' || Förvalt format for datum och tider. Används när användaren inte har gjort sin egen inställning eller valt förvalet för datumformat) ||
|| edit_rows || 30 || Förvald höjd på editorfönstret ||
|| external_diff || 'diff' || Ger dig möjlighet att ge en exakt filsökväg till diff-kommandot eller för att ändra vilket diff-program som ska användas, t.ex. till "gdiff" om GNU diff inte är det normala diff-programmet på din UNIX-variant ||
|| html_head || ''META-Tag with Content-Type'' || Extra <HEAD>-tagg för alla sidor (se HjälpMedSkal) ||
|| html_head_queries || ''META-Tag with "NOINDEX,NOFOLLOW" for robots'' || Extra <HEAD>-tagg för edit och åtgärds-sidor (`html_head` sänds också. Se HjälpMedSkal) ||
|| httpd_docs || './wiki-moinmoin' || katalog med öppet tillgängliga filer när den självständiga servern används ||
|| httpd_host || 'localhost' || värddatornamn för den självständiga servern ||
|| httpd_port || 8080 || port för den självständiga servern ||
|| httpd_user || 'nobody' || användare för att köra den självständiga servern (UNIX endast) ||
|| interwikiname || None || InterWiki-namn (prefix) för platen, eller None ||
|| logo_string || ''MoinMoin logo'' || URL-sökväx för logon som visas i det övre vänstra hörnet av en sida och används i RSS-dokument ||
|| lowerletters || ''Latin 1 alphabetic characters and digits'' || Gemena bokstäver. Används för att definiera vad som är ett WikiNamn ||
|| mail_from || None || `From:`-brevhuvud som används i sända brev ||
|| mail_smarthost || None || IP eller domännamn för en  SMTP-server. Observera att e-post-funktionerna (underrättelser, e-postande av logindata) fungerar endast om den här variabeln är satt ||
|| navi_bar || ''large HTML fragment'' || De viktigaste länkarna i textform (/!\ det här är en gammal funtkion som kommer att försvinna och bli ersatt av bokmärken i OpenWiki:UserPreferences) ||
|| nonexist_qm || 0 || Tillval för att visa ÖnskadeSidor med ett frågetecken, som i originalwikin (kan ändras av användaren) ||
|| page_footer1 || ''Python Powered logo'' || Anpassningsbar HTML-kod som sänds ''före'' systemets sidfote (se HjälpMedSkal) ||
|| page_footer2 || "" || Anpassningsbar HTML-kod som sänds ''efter'' systemets sidfot (se HjälpMedSkal) ||
|| page_form_ending || 'Form' || Efterstavkes för sidor som innehåller formulärdefinitioner ||
|| page_front_page || 'FrontPage' || Namn på framsidan (startsidan) ||
|| page_icons || ''large HTML fragment'' || Ikonraden högst uppe till höger på varje sida ||
|| page_icons_up || ''icon for link to parent'' || Den här ikonen visas på undersidor och länkar tillbaka till huvudsidan ||
|| page_local_spelling_words || 'LocalSpellingWords' || Namn på den sida som innehåller användardefinierade ord för stavningskontrollen ||
|| page_template_ending || 'Template' || suffix för sidor som innehåller mallar för nya sidor ||
|| shared_intermap || None || path to a file containing global InterWiki definitions ||
|| shared_metadb || None || sökväg till en fil som innehåller en global InterWiki sidlista ||
|| show_hosts || 1 || ''true'' för att visa värdnamn i <<GetText(LatestChanges)>> ||
|| show_section_numbers || 1 || ''true'' för att visa avsnittsnummer normalt ||
|| show_timings || 0 || används vid utveckling ||
|| show_version || 0 || visa MoinMoin's version längst ner på varje sida ||
|| sitename || 'An Unnamed MoinMoin Wiki' || Kort beskrivning av din wiki-plats. Visas under logon högst upp på varje sida och används i RSS-dokument som kanaltitel ||
|| title1 || None || HTML-fragment före titelarean (se HjälpMedSkal) ||
|| title2 || '<hr>' || HTML-fragment efter titelarean (se HjälpMedSkal) ||
|| trail_size || 5 || Antal sidor i sidhistoriken som visas ||
|| ua_spiders || htdig || Ett reguljärt uttryck med HTTP_USER_AGENT:er som ska uteslutas från loggning ||
|| umask || 0777 || umask som används på alla open(), mkdir() och liknande systemanrop ||
|| upperletters || ''Latin 1 alphabetic characters'' || Versala bokstäver. Används för att definiera vad som är ett WikiNamn ||
|| url_mappings || {} || uppslagstabell som används för att ändra URL-prefix (dict av {{{'prefix': 'replacement'}}}); speciellt användbart på IntraNet, när hela träd av externa dokement flyttas runt ||
|| url_prefix || '/wiki' || Används som bas-URL för alla allmännt tillgängliga sidor som wikin kan visa, speciellt bildfiler för ikoner ||
|| url_schemas || [] || extra URL-scheman som du vill ha configurerade (lista med strängar) ||


=== Att ändra teckenuppsättning ===

Om du vill använda MoinMoin med en texkenuppsättning annan än Latin-1, kan du behöva ändra 
det förvalda teckenuppsättningen för WikiNamn i "moin_config.py". Ett säkert förval är US-ASCII,  {{{
upperletters = "A-Z"
lowerletters = "0-9a-z"
}}}

Med den inställningen behöver du sätta "`allow_extended_names=1`" och använda det
speciella märktaggarna för utökade WikiNamn["extended name"]` för att få namn
med tecken utanför det latinska alfabetet.


<<Anchor(file-attachments)>>
=== Filbifogningar ===

[wiki:Self:HjälMedDirektiv/BifogaFil Filbifogningsdirektivet] tillåter att en sida har en eller flera bifogade filer.
Eftersom filbifogningar kan bli missbrukade av DoS (Denial of Service)-attacker, är `AttachFile` ett direktiv som först måste tillåtas av wikiadministratören. För att göra detta, lägg till "`allowed_actions = ['AttachFile']`" till din konfigurationsfil.

Det finns också två olika lagrings/återhämtnings-modeller för filbifogningar.
 1. filbifogningar sparas "privat" och kan endast hämtas via CGI GET (via `URL`:er som  `http://wiki.net/moin/NågonSida?action=AttachFile&do=get&target=filenamn.typ`).
 1. filbifogningar sparas i ett filbibliotek som är direktåtkomligt av webb-servern, utan att gå via MoinMoin (vilket leder till `URL`:er som `http://wiki.net/wiki/mywiki/NågonSida/attachments/filnamn.typ`).

Generellt sett är det andras tillvalet att föredra<<FootNote(En sådan konfiguration undviker omkostnaden av en CGI-process för varje nedladdning av en bifogad fil)>>, men gör också att extra konfigurationssteg krävs och kräver mer tillåtelser på värddatorn. På grund av detta är det första alternativet det som är valt som normalt. Filbifogningar sparas i "data"-filkatalogen, med filsökvägar som  "`<data>/pages/<sidname>/attachments/<filenamn>`".

För det andra tillvalet måste du lägga till ett `attachments`-definition till din konfiguration. Detta är ett bibliotek som har två värden: {{{
attachments = {
    'dir': 'C:/Moin/share/moin/htdocs/mywiki',
    'url': '/wiki/mywiki',
}
}}}

`dir` är filsystems sökväg till platsen var filbifogningarna ska sparas och `url` är den matchande URI för att nå denna plats. Både filkatalogerna måste finnas och kunna skrivas i av webbservern, så att den kan skapa de nödvändiga underkatalogerna och filerna för fillbifogningar. Observera att du måste skapa denna filkatalog ''manuellt''. MoinMoin skapar den inte automatiskt för dig.

Ovanstående exemel visar en typisk konfiguration för ett Windows-system som fungerar för en installation baserat på den normala setup-proceduren (se HelpOnInstalling/ApacheOnWin32).
För Linux, om du följer HelpOnInstalling/ApacheOnLinux, den nödvändiga konfigurationen ser ut som: {{{
attachments = {
    'dir': '/usr/local/share/moin/htdocs/mywiki',
    'url': '/wiki/mywiki',
}
}}}
Efter att du har avslutat alla konfigurationsändringar, försök att skapa ett filtillägg för att prova om det fungerar. Om du har filsäkerhetsproblem får du antagligen en Python-traceback eller något felmeddelande.
