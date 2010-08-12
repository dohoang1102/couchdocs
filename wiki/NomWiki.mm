## Please edit system and help pages ONLY in the moinmaster wiki!
## For more information, please see MoinMaster:MoinPagesEditorGroup.
## Merci de n'éditer les pages systèmes et d'aide QUE sur MoinMaster !
## Pour plus d'information, consultez MoinMaster:MoinPagesEditorGroup.
##master-page:WikiName
##master-date:2005-01-09 18:04:22
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language fr

Un NomWiki est un nom formé de plusieurs mots commençant par une majuscule. Les [:NomWiki: NomsWiki] deviennent automagiquement des liens hypertextes pointant vers la page de titre correspondant. Les caractères considérés comme minuscules et majuscules dépendent de la configuration. La configuration par défaut devrait fonctionner pour les caractères Unicode (en codage UTF-8).

En cliquant sur le titre mis en relief de la page (par exemple NomWiki pour cette page), vous obtiendrez une liste de toutes les pages qui pointent vers celle-ci. Cela marche même pour les pages qui n'ont pas été définies.

Lorsqu'un lien est précédé d'un point d'interrogation ou affiché d'une manière distincte en gras et en rouge, cela indique que la page n'est pas encore définie. Il suffit de cliquer sur le lien ou sur le point d'interrogation pour proposer une définition (cf. par exemple, CettePageEstVraimentInexistante). En cliquant sur l'un de ces liens, on affiche une page par défaut qu'il est possible de modifier. C'est seulement après enregistrement (''Enregistrer les modifications'') que la page sera vraiment créée. Une liste de toutes les pages non encore définies mais déjà référencées par d'autres pages est disponible sur la page ["PagesÀCréer"].

Pour éviter qu'un mot se transforme en NomWiki, c'est-à-dire si on veut écrire le mot Nom''''''Wiki sans créer de lien, il vous faut utiliser une séquence vide de texte en caractères gras, c'est-à-dire une suite de six apostrophes, comme ceci :  {{{Nom''''''Wiki}}}. Une autre solution est d'utiliser deux apostrophes inversées « {{{``}}} », ce qui donnera donc : {{{Nom``Wiki}}}.

 * Pour en savoir plus sur les règles de mise en forme, consultez l'["AideDeL'Édition"].
 * Voir également dans l'AideDeLaCréationDeLiens, le paragraphe « Noms de pages arbitraires ».
