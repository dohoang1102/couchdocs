## Please edit system and help pages ONLY in the moinmaster wiki!
## For more information, please see MoinMaster:MoinPagesEditorGroup.
## Merci de n'éditer les pages systèmes et d'aide QUE sur MoinMaster !
## Pour plus d'information, consultez MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnFormatting
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language fr
== Règles de formatage ==

Laissez des lignes blanches entre les paragraphes. Utilisez {{{<<BR>>}}} pour insérer des sauts de ligne dans les paragraphes.

Vous pouvez écrire du texte en ''italique'' ou en '''gras'''.
Pour écrire en italique, mettez le texte entre deux apostrophes doubles.
Pour écrire en gras, mettez le texte entre deux apostrophes triples.
Pour __souligner du texte__, mettez le entre deux caractères soulignés doubles : {{{__texte souligné___}}}.
Pour obtenir du ^texte en exposant^, mettez le entre deux accents circonflexes. Pour le ,,texte en indice,, , il suffit de le mettre entre deux couples de virgules.

Pour insérez le source d'un programme sans avoir à le formater et en utilisant une {{{fonte à chasse fixe}}}, utilisez des accolades triples :
{{{
10 PRINT "Hello, world!"
20 GOTO 10
}}}

Dans les sections contenant du code (en ligne ou non), tous les marqueurs wiki sont ignorés. Une syntaxe alternative et plus courte pour du `code en ligne` est d'utiliser l'apostrophe inverse (cela peut être désactivé par l'administrateur du site, mais c'est activé par défaut).

Pour plus d'infos sur les marqueurs disponibles, voyez ["AideDeL'Édition"].

=== Exemple ===
{{{
__Mélange__ ''italique'' et '''gras''':
 * '''''Mélange''' au début''
 * '''''Mélange'' au début'''
 * '''Mélange à la ''fin'''''
 * ''Mélange à la '''fin'''''

Peut-être avez-vous vu en maths que ''a''^2^ `+` ''b''^2^ `=` ''c''^2^ sauf
si vous avez la tête remplie de H,,2,,O.

Une { { {séquence de code en ligne} } } doit avoir ses marqueurs de début et de
fin sur la même ligne. Sinon, utilisez les `apostrophes inverses`.

Par contre, pour les blocs de code, ils sont sur des lignes différentes : { { {
'''Pas''' de marqueurs ici !
} } }
}}}

/!\ Dans les exemples ci-dessus, les accolades ont été espacées par un espace pour leur faire perdre leur sens.

=== Display ===
__Mélange__ ''italique'' et '''gras''':
 * '''''Mélange''' au début''
 * '''''Mélange'' au début'''
 * '''Mélange à la ''fin'''''
 * ''Mélange à la '''fin'''''

Peut-être avez-vous vu en maths que ''a''^2^ `+` ''b''^2^ `=` ''c''^2^ sauf si vous avez la tête remplie de H,,2,,O.

Une {{{séquence de code en ligne}}} doit avoir ses marqueurs de début et de fin sur la même ligne. Sinon, utilisez les `apostrophes inverses`.

Par contre, pour les blocs de code, ils sont sur des lignes différentes : {{{
'''Pas''' de marqueurs ici !
}}}

=== Mise en couleur du code ===

Pour que la mise en valeur en couleur du code Python<<FootNote(Seul Python est supporté pour le moment.)>>, voici différentes solutions :
 1. la première ligne doit contenir "#!python"
 1. vous pouvez inclure un fichier ayant comme extension ".py" avec "inline"
 1. commencez une page en mettant comme instruction de traitement "#format python"

Exemple: {{{
#!python
from colors import palette
palette.colorize('python')
}}}
