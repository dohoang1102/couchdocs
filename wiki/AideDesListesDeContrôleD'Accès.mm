## Please edit system and help pages ONLY in the moinmaster wiki!
## For more information, please see MoinMaster:MoinPagesEditorGroup.
## Merci de n'éditer les pages systèmes et d'aide QUE sur MoinMaster !
## Pour plus d'information, consultez MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnAccessControlLists
##master-date:2005-02-06 16:03:32
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language fr
#pragma section-numbers 2

= Listes de contrôle d'accès (ACL) =

Lorsque les listes de contrôle d'accès (ACL) sont activées, vous pourrez contrôler qui peut faire quoi sur ou avec chaque page du wiki.

== Sommaire ==
<<TableOfContents>>

== Bases ==

La première chose à savoir est que le fonctionnement des listes de contrôle d'accès est désactivé par défaut. Reportez-vous à la section [#Configuration Configuration] pour apprendre comment les activer.

L'utilisation de listes de contrôle d'accès dans [wiki:MoinMoinVF MoinMoin] est très simple : il suffit d'ajouter une ligne de contrôle en haut de la page que vous désirez contrôler. Cette ligne de contrôle ressemble à ceci :

{{{
#acl UnUtilisateur:read,write All:read
}}}

/!\ Vous devrez posséder les droits d'administrateur (`admin`) pour avoir le droit d'ajouter ou de modifier une telle ligne.

Cela permettra à `UnUtilisateur` de lire et d'écrire sur cette page et à tous les autres de lire cette page sans pouvoir y écrire (à moins que vous n'ayez mis en place des paramètres spécifiques dans la configuration du site).

/!\ Les pièces-jointes, lorsque l'on y accède via le moteur du wiki, sont également protégées par la liste de contrôle d'accès de la page à laquelle elle sont rattachées.

{fr} Attention, la version française de cette page suppose que vous ayez configuré les groupes comme indiqué à la fin de la section [#Groupes].

== Syntaxe ==

Chacune des lignes de la liste de contrôle d'accès doit respecter la syntaxe suivante :

{{{
#acl [+-]Nom[,Groupe,...]:[droit[,droit,...>> <<+-]AutreNom:...] <<+-]Trusted:...] <<+-]Known:...] <<+-]All:...] [Default]
}}}

Où :

 * '''Nom''' est un nom d'utilisateur. La règle s'appliquera si le nom correspond.

 * '''Groupe''' est un nom de page correspondant à l'expression rationnelle `page_group_regex`. Cette page doit contenir des lignes du type « ` * Membre` » (Voir [#Groupes]).

 * '''Trusted''' est un groupe spécial contenant tous les utilisateurs authentifiés via HTTP (HTTP-Basic-authentication).

 * '''Known''' est un groupe spécial contenant tous les utilisateurs identifiés (par exemple, les utilisateurs reconnus via un ''cookie'').

 * '''All''' est un groupe spécial contenant tous les utilisateurs (connus ou anonymes).

 * '''Default''' est une règle spéciale qui ajoute à l'endroit indiqué les règles par défaut définies dans {{{acl_rights_default}}} (voir [#ParDéfaut]).

 * '''droit''' est un mot-clef choisi parmi read, write, delete, revert, admin. Seuls les mots-clefs définis dans le paramètre `acl_rights_valid` sont reconnus. Les autres seront ignorés. Il est possible de n'indiquer aucun droit, ce qui indique qu'aucun droit n'est accordé.

== Définition des droits ==

Voici la liste des droits que vous pouvez utiliser dans les règles composant votre liste de contrôle d'accès. Attention cependant, l'utilisateur doit être membre (implicite) du groupe `Known` pour avoir le droit de renommer ou de supprimer une page, même si le droit de suppression (`delete`) lui a été accordé.

 read::
 Les utilisateurs indiqués pourront lire le texte de cette page.

 write::
 Les utilisateurs indiqués pourront écrire (éditer) le texte de cette page.

 delete::
 Les utilisateurs indiqués pourront supprimer cette page et ses pièces jointes.

 revert::
 Les utilisateurs indiqués pourront restaurer une ancienne version de cette page.

 admin::
 Les utilisateurs indiqués bénéficieront des droits d'administration sur cette page. Ce qui veut dire qu'ils pourront modifier la liste de contrôle d'accès de cette page, y compris en donnant ou en supprimant les droits d'administration à d'autres.

== Logique de fonctionnement ==

Lorsqu'un utilisateur essaie d'accéder à une ressource protégée par une liste de contrôle d'accès, celle-ci sera appliquée selon l'ordre où elle a été indiquée. La '''première règle correspondant à l'utilisateur''' servira a déterminer si l'utilisateur a accès ou non à la ressource. Le traitement de la liste de contrôle d'accès s'arrêtera dès qu'une règle correspondant à l'utilisateur aura été trouvée.

(!) Du fait du choix d'utiliser la '''première correspondance''', il est préférable de trier vos listes de contrôle d'accès en indiquant en premier les noms d'utilisateurs individuels, puis les groupes spécialisés, suivis des groupes plus généraux, puis ''Known'' et enfin ''All''.

Par exemple, le liste de contrôle d'accès suivante indique que ''U''''''nUtilisateur'' à le droit de lire et d'écrire la ressource protégée. Tous les membres du groupe ''G''''''roupeExemple'' (sauf ''U''''''nUtilisateur'' s'il en fait partie) auront également le droit d'administrer cette page. Enfin, tous les autres utilisateurs auront le droit de la lire.

{{{
#acl UnUtilisateur:read,write GroupeExemple:read,write,admin All:read
}}}

Pour rendre ce système plus souple, il existe également deux modificateurs : les préfixes « + » et « - ». Lorsque ces modificateurs sont utilisés, le traitement de la liste de contrôle d'accès ne s'arrêtera que lorsque le droit demandé pour un utilisateur correspond à la fois à l'utilisateur et au droit indiqués dans la règle donnée. Le traitement continuera si vous êtes à la recherche d'un autre droit (ou d'un autre utilisateur). Dans le cas de « + », le droit correspondant sera accordé, dans celui de « - », il sera refusé (s'il y a correspondance).

Par exemple, en supposant que ''U''''''nUtilisateur'' soit membre du groupe ''G''''''roupeExemple'', la liste de contrôle d'accès ci-dessus pourrait être reformulée comme ceci :

{{{
#acl -UnUtilisateur:admin GroupeExemple:read,write,admin All:read
}}}

Cet exemple n'est particulier que pour ''U''''''nUtilisateur'', car lors de la vérification du droit d'administration pour ''U''''''nUtilisateur'', le droit sera refusé et le traitement de la liste s'arrêtera. Dans tous les autres cas, le traitement continuera.

Ou même :

{{{
#acl +All:read -UnUtilisateur:admin GroupeExemple:read,write,admin
}}}

`+All:read` indique que lorsqu'un utilisateur quel qu'il soit demande le droit de lecture, il lui est accordé et le traitement s'arrête. Dans tous les autres cas, le traitement de la liste se poursuivra. Lors de la vérification du droit d'administration pour ''U''''''nUtilisateur'', ce droit sera refusé et le traitement s'arrêtera. Dans tous les autres cas, le traitement de la liste se poursuivra. Enfin, si un membre de ''G''''''roupeExemple'' demande un droit, il sera accordé s'il est indiqué ici et refusé autrement. Aucun autre utilisateur n'aura de droit, à moins que ceux-ci soient donnés par la configuration.

Remarquez que les deuxième et troisième exemples ne sont pas très indiqués comme liste de contrôle d'accès d'une page. Ils peuvent par contre être très utiles dans les paramètres de configuration d'un site.

<<Anchor(ParDéfaut)>>
== Hériter des valeurs par défaut ==

Il est parfois utile de donner des droits à quelqu'un sans trop modifier les droits par défaut. Par exemple, supposons que votre configuration contienne les paramètres suivants :

{{{
acl_rights_default = "GroupeAuteur:read,write,delete,revert All:read"
acl_rights_before  = "GroupeAdmin:admin,read,write,delete,revert +GroupeAuteur:admin"
}}}

Maintenant, vous souhaitez accorder à ''U''''''nUtilisateur'' le droit d'écrire (`write`) sur une page, mais vous souhaitez conserver les droits par défaut du ''G''''''roupeAuteur''. Vous pouvez facilement le faire en ajoutant une règle '''Default''' :

{{{
#acl UnUtilisateur:read,write Default
}}}

Cette règle va ajouter le contenu du paramètre {{{acl_rights_default}}} à l'endroit exact où est placé le mot ''Default''. En d'autres termes, la liste ci-dessus associée à la configuration indiquée correspond à la liste suivante :

{{{
#acl UnUtilisateur:read,write GroupeAuteur:read,write,delete,revert All:read
}}}

Examinez maintenant le premier exemple de cette section :

{{{
acl_rights_before  = "GroupeAdmin:admin,read,write,delete,revert +GroupeAuteur:admin"
}}}

Les listes de contrôle d'accès sont traitées dans l'ordre suivant : liste du paramètre « avant » (''before''), liste de la page ou liste par défaut (''default'') puis pour terminer, liste du paramètre « après » (''after''). Les listes de contrôle d'accès sont traitées de gauche à droite.

Donc, nous commençons à gauche de la liste contenue dans le paramètre ''before'' avec `GroupeAdmin:...` - cette règle s'applique si vous êtes un membre du groupe admin. S'il y a correspondance, les droits indiqués vous sont accordés (arwdr) et le traitement des listes de contrôle d'accès ''s'arrête''.

S'il ne correspond pas, le traitement des listes continue. La règle suivante est : `+GroupAuteur:admin` - cette règle s'applique si vous êtes un membre du groupe auteur.

S'il y a correspondance, le droit (a) vous est accordé et - le cas est différent car la règle utilise un modificateur - le traitement des listes de contrôle d'accès ''continue'' ! Donc, s'il y a une autre correspondance pour ce groupe, votre nom d'utilisateur ou ''Known'' ou ''All'' vous bénéficierez également de ces droits.

S'il n'y a pas correspondance, le traitement continue.

Le traitement se poursuit donc avec la liste de contrôle d'accès de la page (s'il y en a une) ou la liste de contrôle d'accès par défaut (sinon), puis enfin par la liste de contrôle d'accès contenue dans le paramètre ''after''.

Bien que ces listes soient équivalentes, hériter de la liste par défaut présente l'intérêt d'intégrer automatiquement toutes les modifications apportées à la liste de contrôle d'accès par défaut.

<<Anchor(Configuration)>>
== Configuration ==

Les paramètres suivants sont utilisés pour paramétrer les listes de contrôle d'accès.

||<rowbgcolor="#FFFFE8"> '''Paramètre'''||'''Valeur par défaut'''||'''Description'''||
||acl_enabled||{{{0}}}||Passer ce paramètre à vrai active l'utilisation des listes de contrôle d'accès.||
||acl_rights_before||{{{""}}}||Liste de contrôle d'accès appliquée '''avant''' la liste de la page ou la liste par défaut.||
||acl_rights_after||{{{""}}}||Liste de contrôle d'accès appliquée '''après''' la liste de la page ou la liste par défaut.||
||acl_rights_default||{{{"Trusted:read,write,delete,revert \}}}<<BR>>{{{Known:read,write,delete,revert \}}}<<BR>>{{{All:read,write"}}}||Utilisé '''uniquement''' si '''aucune''' liste de contrôle d'accès n'est donnée dans la page accédée.||
||acl_rights_valid||`["read", ` `"write", ` `"delete", ` `"revert", ` `"admin"]`||La liste des droits valides (reconnus) - et l'endroit où ajouter des extensions si nécessaire.||

Ce tableau vous indique le rôle de chaque paramètre, mais pas ce qu'il signifie :

 * « avant » (''before'') correspond à '''imposer des règles''' (à cause de l'algorithme de première correspondance) ;

 * « après » (''after'') correspond à '''s'assurer de ne rien oublier''' (par exemple en donnant le droit de lecture à tous le monde) ;

 * « par défaut » (''default'') indique ce qu'il faut faire si aucune liste de contrôle d'accès n'est indiquée sur la page.

<<Anchor(Groupes)>>
== Les groupes ==

Les groupes d'utilisateurs facilitent la définition des droits pour des plus grands groupes d'utilisateurs.

Seul les amis de ''U'''''''nUtilisateur'' peuvent lire et modifier cette page :

{{{
#acl UnUtilisateur:read,write UnUtilisateur/GroupeDesAmis:read,write
}}}

{{{UnUtilisateur/GroupeDesAmis}}} étant une page contenant une liste de premier niveau dont chacune des entrées indique un nom d'utilisateur appartenant à ce groupe :

{{{
#acl UnUtilisateur:read,write,admin,delete,revert
 * JeanDupont
 * PierreDurand
 * PaulMartin
}}}

Une page appelée `GroupeAdmin` pourrait définir un groupe de ce nom protégé par une liste de contrôle d'accès :

{{{
#acl GroupeAdmin:admin,read,write All:read
 * UnUtilisateur
 * UnAutreUtilisateur
   * Ce texte est actuellement ignoré.
Tout autre texte non situé dans la liste de premier niveau sera ignoré.
}}}

/!\ une liste de premier niveau est une liste avec une seule espace avant l'astérisque (et il doit aussi n'y avoir qu'une espace après l'astérisque). L'exemple suivant ne marche pas :

{{{
  * un utilisateur
-- l'astérisque est précédée de 2 espaces, donc ça ne marche pas.
}}}

Vous pouvez définir quels noms de pages sont considérées comme des pages de définition de groupes (par exemple pour des wikis nom-anglophones).

{fr} Pour un wiki francophone, nous vous recommandons d'adopter le paramétrage ci-dessous :

{{{
page_group_regex =  '^Groupe'    # paramètre conseillé pour le français
}}}

== Exemples d'utilisation ==

=== Wiki d'une communauté publique sur internet ===

Le point le plus important ici est de n'utiliser les listes de contrôle d'accès que là où c'est réellement nécessaire. Les wikis dépendent de la liberté d'accès à l'information et de la liberté d'édition. Ils se basent sur une sécurité douce pour nettoyer les entrées malveillantes. Donc, en général, les listes de contrôle d'accès ne sont pas nécessaires; si vous en abusez, vous risquez de détruire ce qui fait la force des wikis.

C'est pourquoi soit les listes de contrôle d'accès ne devraient pas être utilisées du tout (ce qui est le paramétrage par défaut), soit, si elle sont utilisées, des paramètres tels que les paramètres ci-dessous devraient être utilisés dans le fichier wikiconfig.py :

{{{
acl_rights_before = 'NomÉditeur:read,write,admin,delete,revert +GroupeAdmin:admin PersonneMalveillante:' 
}}}

La valeur par défaut du paramètre {{{acl_rights_default}}} devrait vous convenir :
{{{
acl_rights_default = 'Known:read,write,delete,revert All:read,write' 
}}}

Il est recommandé d'avoir un petit groupe d'administrateurs de confiance dans le ''G''''''roupeAdmin'' (ils devront bien connaître le fonctionnement d'un wiki, sinon, ils risquent de détruire sans le vouloir l'ouverture qui fait la richesse d'un wiki).

Si vous utilisez un ''G''''''roupeAdmin'', créez une page appelée ''G''''''roupeAdmin'' et utilisez-là pour indiquer la liste des personnes recevant les droits d'administration.

Indiquer ''P''''''ersonneMalveillante'' comme ci-dessus revient à empêcher cet utilisateur d'utiliser le wiki - il ne peut plus rien lire ni éditer avec son compte. Cela n'a de sens que comme mesure temporaire, autrement il vaut mieux carrément supprimer le compte. Naturellement, cette ''P''''''ersonneMalveillante'' peut aussi travailler anonymement, donc ce n'est pas une réelle protection (c'est ici que la sécurité douce entre en jeu).

=== Un système simple de gestion d'informations (CMS) ===

Si vous souhaitez utiliser le wiki pour créer simplement des pages web, mais que vous ne souhaitez pas que le public puisse le modifier (autrement dit, que les modifications soient limitées à un petit groupe de webmestres), vous pouvez utiliser une configuration comme celle-ci :

{{{
acl_rights_default = 'All:read' 
acl_rights_before  = 'WebMestre,AutreWebMestre:read,write,admin,delete,revert' 
}}}

Donc, tout le monde peut lire, mais seuls les webmestres peuvent faire quoi que ce soit d'autre. Tant que ceux-ci sont encore en train de travailler sur une nouvelle page, il peuvent indiquer sur celle-ci :

{{{
#acl All: 
}}}

Ce qui implique que personne d'autre ne sera capable de consulter une page avant qu'elle soit prête. Lorsque la page est terminée, n'oubliez pas d'enlever cette ligne, afin que {{{acl_rights_default}}} soit à nouveau utilisé.

Quelques pages peuvent aussi être utilisée pour permettre des commentaires du public (par exemple, une page ''V''''''otreAvis''). Vous devrez donc donner plus de droits sur cette page :

{{{
#acl All:read,write 
}}}

=== Wiki sur un réseau interne (intranet) ===

Si vous souhaitez utiliser un wiki sur votre réseau interne d'entreprise et que vous avez suffisamment confiance en vos utilisateurs (vous pensez qu'ils ne réaliseront pas d'actions hostiles comme empêcher les utilisateurs d'accéder à certaines pages ou détourner certaines pages) pour leur donner accès aux droits d'administration, vous pourriez utiliser quelque-chose comme cela :

{{{
acl_rights_default = 'Known:admin,read,write,delete,revert All:read,write'
acl_rights_before  = 'AdminWiki,GrandChef:read,write,admin,delete,revert' 
}}}

Ce qui veut dire que tout le monde peut lire, écrire et modifier les droits et que ''A''''''dminWiki'' et ''G''''''randChef'' sont assurés de toujours avoir tous les droits. Les utilisateurs identifiés (''Known'') obtiennent les droits d'administration via le paramètre par défaut (acl_rights_default) - autrement dit, ils on les droits d'administration tant que la page ne contient pas de liste de contrôle d'accès.

Conséquences :

 * sur une nouvelle page, le créateur de la page peut choisir la liste de contrôle d'accès qui lui convient ;

 * sur les pages existante sans liste de contrôle d'accès, tout utilisateur identifié (''Known'') peut ajouter la liste de contrôle d'accès de son choix ;

 * tout le monde (sauf ''A''''''dminWiki'' et ''G''''''randChef'') peut être empêché d'accéder à une page sans liste de contrôle d'accès par n'importe quel utilisateur identifié.

=== Site public d'une société ===

Si vous souhaitez utiliser un wiki comme site internet d'une société et que vous ne souhaitez pas que n'importe-qui puisse modifier le contenu du site, vous pourrez faire quelque-chose comme ceci :

{{{
acl_rights_default = "GroupeAuteur:admin,read,write,delete,revert All:read"
acl_rights_before  = "GroupeAdmin:admin,read,write,delete,revert +GroupeAuteur:admin"
}}}

Ce qui veut dire que :

 * par défaut, les utilisateurs identifiés (''Known'') et anonymes ont uniquement le droit de lire les pages ;

 * sur une nouvelle page, les membres du ''G''''''roupeAuteur'' peuvent définir la liste de contrôle d'accès de leur choix ;

 * sur les pages existante sans liste de contrôle d'accès, tout membre du ''G''''''roupeAuteur'' peut définir la liste de contrôle d'accès de son choix ;

 * tout le monde, sauf les membres du ''G''''''roupeAdmin'', peut être empêché d'accéder à une page par n'importe quel membre du groupe admin ou auteur ;

 * les membres du ''G''''''roupeAuteur'' bénéficient des droits d'administration sur toutes les pages sur lesquels ils peuvent écrire, même si ces pages ont leurs propres listes de contrôle d'accès.

=== Commentaires sur une page en lecture seule ===

Il est facile d'ajouter une section commentaires à une page en lecture seule en utilisant une sous-page ouverte en écriture et en permettant aux utilisateurs d'y écrire. Par exemple, on peut définir ''U''''''nePage'' comme ceci :

{{{
#acl UnUtilisateur:read,write All:read
'''Quelques informations en lecture seule'''

...

'''Commentaires utilisateurs'''
<<Include(UnePage/Commentaires)>>
}}}

Et ''UnePage/Commentaires'' ainsi :

{{{
#acl All:read,write
Ajoutez ici vos commentaires sur UnePage.
}}}
