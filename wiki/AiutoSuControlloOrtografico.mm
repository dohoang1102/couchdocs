## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language it
AiutoContenuti > AiutoSuAmministrazione > AiutoSuControlloOrtografico

== L'opzione di Controllo Ortografico ==

MoinMoin cerca le parole valide in due posti:
 * nella directory "dict" che si trova dentro il modulo Python di MoinMoin
 * nella pagina ParoleItalianeVerificate

If the "dbhash" module is available with your Python installation, the files in "dict" are read only ''once'' and stored in a hash table. This speeds up the spell checking process because then the number of words in the ''checked page'' determines the time needed for the checking, ''not'' the number of words in the dictionary (with 250000 words, some hundred milliseconds instead of several seconds).

Note that it may take a few minutes to build up this database, but only the first time the spellchecker is called. If your browser or the webserver timeouts before the file is completely built, one solution is to telnet into your webserver, and manually request the page<<FootNote(The next version will provide a tool to create the database on the command line.)>>.

BTW, a UNIX machine normally comes with at least one words file; to use those, create a symlink within the dict directory, like so:
{{{
MoinMoin/dict> ln -s /usr/dict/words .
}}}
On some systems, the words file is found in "/usr/share/dict/words" instead.

=== Example ===
{{{
MoinMoin> ls -l dict
drwxr-xr-x   7 544      everyone        0 Jan 04 08:29 CVS
-rw-r--r--   1 544      everyone   409067 Jan 04 06:38 american-english
-rw-r--r--   1 544      everyone  2913577 Jan 25  2000 german.txt
-rw-r--r--   1 544      everyone    92631 Nov 30 15:24 top10000de.txt
}}}

=== Words files ===
If you need words files for US English or German, you can find them [http://moin.sf.net/files/ here].

=== If it doesn´t work ===

If you change the contents of "MoinMoin/dict/" (because of adding new / removing old dictionaries) or if you create a new "MoinMoin/dict/" directory, then you have to delete the file "MoinMoin/wiki-moinmoin/data/dict.cache" (a new one will be created automagically).

If you don't, your new dictionaries won't be recognized (e.g. it will use only LocalSpellingWords). Another possible cause of problems is that you did not place the dictionaries in the ''active'' "MoinMoin" package directory, i.e. the one that is actually imported by your CGI script.
