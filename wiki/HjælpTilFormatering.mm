## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnFormatting
##master-date:2002-03-04 21:53:55
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language da
== Textformateringsregler ==

Hold afstand med blanke linjer mellem afsnit. Brug {{{<<BR>>}}} til at lave linjeskift i afsnit.

Du kan fremhæve tekst som ''kursiv'' eller '''fed'''.
Kursiv fås ved at omkranse teksten med 2 x enkelte anførselstegn.
Fed fås ved at omkranse teksten med 3 x enkelte anførselstegn.
Du kan få ^superscript tekst^ ved at omkranse med circumflex (potens-tegn).

Indsæt program-kildekode uden formatering, vist med {{{"fast bredde"-skrifttype}}} vha. tre "tuborg-klammer":
{{{
10 PRINT "Hello, world!"
20 GOTO 10
}}}

Bemærk, at indenfor kodeafsnit, både indlejret og fremvist, bliver al wiki markup ignoreret. En alternativ og kortere syntaks for `indlejret kode` er at bruge "backtick" tegn (bemærk at det 
kan slås fra i sitets opsætning, men er aktiveret som standard).

Du kan få mere information om mulig markup under HelpOnEditing.

=== Eksempel ===
{{{
Blander ''kursiv'' og '''fed''':
 * '''''Blandet''' i begyndelsen''
 * '''''Blandet'' i begyndelsen'''
 * '''Blandet i ''slutningen'''''
 * ''Blandet i '''slutningen'''''

Du husker muligvis ''a''^2^ `+` ''b''^2^ `=` ''c''^2^ fra matematiktimerne.

En { { {indlejret kodesekvens} } } har start- og slutmarkørerne på samme linje. Ellers skal du bruge `backticks`.

En kodefremvisning har markørerne på forskellige linjer: { { {
'''Ingen''' markup her!
} } }
}}} 
/!\ I eksemplet ovenfor har vi escape't markørerne til kildekodesekvenser ved at indsætte mellemrum mellem tuborg-klammerne.

=== fremvist ===
Blander ''kursiv'' og '''fed''':
 * '''''Blandet''' i begyndelsen''
 * '''''Blandet'' i begyndelsen'''
 * '''Blandet i ''slutningen'''''
 * ''Blandet i '''slutningen'''''

Du husker muligvis ''a''^2^ `+` ''b''^2^ `=` ''c''^2^ fra matematiktimerne.

En {{{indlejret kodesekvens}}} har start- og slutmarkørerne på samme linje. Ellers skal du bruge `backticks`.

En kodefremvisning har markørerne på forskellige linjer: {{{
'''Ingen''' markup her!
}}}

=== Farvelagt kodefremvisning ===
Der er flere måder at få farvelagt formatering af Python kode<<FootNote(Der er i øjeblikket ikke support for andre sprog end Python.)>>:
 1. start en kodefremvisning med en linje som kun indeholder "#!python"
 1. Tilknyt indlejret en fedhæftet fil med endelsen ".py" vha. "inline:"
 1. start en side med en Python-format proces-instruktion ("#format python")

Eksempel: {{{
#!python
from colors import palette
palette.colorize('python')
}}}
