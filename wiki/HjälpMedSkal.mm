## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##translated-by:Karolina Lindqvist, Shakti Wiki
##master-page:HelpOnSkins
##master-date:2002-03-12 10:00:41
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sv
== Att ändra sidlayouten ==

Även om MoinMoin för närvarande inte har fullt stöd för HTML-mallar (templates) och bytanded till olika layouter, kan du ändra viktiga delar av den genererade HTML-koden och också lägga till dina egna HTML-fragment.

"`title1`" och "`title2`" sätts in när sidan visas precis före och efter systemets htmlkod (`title1` kommer rakt efter <body>-taggen och är normalt odefinierad. `title2` har som normalvärde "`<hr>`"-taggen ovanför sidinnehållet). "`navi_bar`" är en lista på sidnamn<<FootNote(I tidigare versioner än 0.11 var navi_bar en bit HTML-kod.)>> som adderas till sidhuvuder med snabblänkar till wikin. Om den är `None` så visas ingen navigeringsrad.

På ett liknande sätt så kan sidfoten ändras genom att sätta "`page_footer1`" och "`page_footer2`".

"`html_head`" adderas in i <head>-elementet för ''alla'' sidor medans "`html_head_queries`" inkluderas för redigerings- och åtgärdssidor (`html_head` sänds iväg för sådana sidor också).

Se http://openlook.org/ för ett fint exempel.
