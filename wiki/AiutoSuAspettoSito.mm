## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language it
<!> TODO

== Cambiare la disposizione della pagina ==

Sebbene MoinMoin non offra un pieno supporto ai modelli HTML e per
poter scegliere tra diversi layout, puoi cambiare le parti più importanti
del codice HTML generato per la pagina, e aggiungere tuoi spezzoni di
codice.

 * pié di pagina configurabile ("page_footer1" e "page_footer2")
 * config.title1 e config.title2 vengono inseriti nell'output subito
 prima e subito dopo il titolo HTML di sistema (title1 viene emesso
 subito dopo la tab <body> e non è definito per default, title2 è
 impostato a "<hr>", che precede il contenuto della pagina)
 * navi_bar

|| html_head || ''META-Tag with Content-Type'' || Ulteriori tag <HEAD> per tutte le pagine (vedi AiutoSuAspettoSito) ||
|| html_head_queries || ''META-Tag with "NOINDEX,NOFOLLOW" for robots'' || Ulteriori tag <HEAD> per le pagine di modifica e quelle generate dalle azioni (viene inserito anche `html_head`; vedi AiutoSuAspettoSito) ||
|| title1 || None || Spezzone HTML da inserire prima del titolo (vedi AiutoSuAspettoSito) ||
|| title2 || '<hr>' || Spezzone HTML da inserire dopo il titolo (vedi AiutoSuAspettoSito) ||
