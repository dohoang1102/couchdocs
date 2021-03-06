## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language it
== Istruzioni che alterano la visualizzazione della pagina ==

Le istruzioni di processo di MoinMoin hanno la stessa funzione che in XML:
controllano il percorso intrapreso per processare la pagina. Queste istruzioni sono
delle righe che cominciano con un carattere {{{#}}} seguito da una parola chiave e
opzionalmente da parametri; la parola chiave viene sempre trattata senza dar peso al
maiuscolo/minuscolo. Due di quei caratteri consecutivi all'inizio di una riga denotano
l'inizio di un commento che non apparira' nella pagina visualizzata.

Processing instructions this wiki knows of:
 * {{{##}}} ''any-text'': comment
 * {{{#FORMAT}}} ''format-specifier'': defines the input format for this page, known formats are:
   * '''Wiki''': default MoinMoin wiki markup
   * '''Plain''': normal plain text
   * '''Python''': colorized Python source
   * '''HTML''' ( <!> not implemented)
 * {{{#REDIRECT}}} ''pagename'': redirect to a different page (see MeatBall:PageRedirect'''''')
 * `#PRAGMA` ''mode'' ''args'': sets processing modes for this page; mode names are not case-sensitive, currently known modes are:
    * `#pragma section-numbers off` (or "0") switches off automatic numbering of section headers,
    and "on" or "1" enables numbering (the default mode is set by the `show_section_numbers` config option)
 * {{{#DEPRECATED}}}: Mark this page as deprecated, i.e. further changes to the page will create no backup versions and displaying it will show the current contents (usually the reason why this page is deprecated) plus the last backup. This effectively freezes the last version of the page, makes it unavailable for searches (no hits on stale content), but keeps that content available for viewing.

All PIs must appear at the very start of a page. An exception are comment PIs, those may appear anywhere within a  page using "wiki" format (but not in pages using other formats).

For more information on the possible markup, see HelpOnEditing.
