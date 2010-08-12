## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language it
AiutoContenuti > AiutoSuAmministrazione > AiutoSuCancellazionePagina

== Come cancellare delle pagine ==

La maniera tradizionale di cancellare una pagina è via shell, collegandosi
al server. Le pagine si trovano nella directory "data/test", e puoi
semplicemente cancellarle da lì.

Se abilitato (vedi AiutoSuConfigurazione e AiutoVarie/DomandePosteFrequentemente),
puoi cancellare le pagine con l'azione {{{DeletePage}}}. Cancellare una
pagina in realtà significa farne una copia di backup, e poi cancellarne
il file dal sistema. Questo è praticamente equivalente al salvare una
pagina vuota (cosa che non è consentita dal sistema).

What this means is that you can get back at deleted pages by using the
standard mechanisms, see also the
HelpMiscellaneous/FrequentlyAskedQuestions entry "Can I restore a page
from an older version?" for this. Especially, if you enter the page
name into the `GoTo` dialog, you'll see the usual page creation stuff,
but clicking on `PageInfo` will reveal the old version history, unless
the page was purged out of existence inbetween.
