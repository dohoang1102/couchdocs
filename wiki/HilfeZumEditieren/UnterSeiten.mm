## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnEditing/SubPages
##master-date:2002-01-24 15:59:57
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language de
HilfeInhalt > HilfeZumEditieren

== Unterseiten anlegen ==

Unterseiten sind Gruppen von Seiten, die einen gemeinsamen Präfix teilen, der selbst eine andere Seite ist. Obwohl dies auch mit dem "klassischen" Wiki möglich ist - nämlich durch Verwendung von Wikinamen wie {{{EinThemaUnterThema}}} - erlaubt die Benutzung von {{{EinThema/UnterThema}}} bessere Navigations-Unterstützung. Sie können dann auch den gemeinsamen Präfix weglassen, wenn Sie von der Elternseite auf die Kindseite verweisen.

Durch die Verwendung von "/", um mehrere WikiName``n zusammenzufügen, können Sie beliebig tiefe Hierarchien aufbauen (innerhalb gewisser Grenzen, insbesondere der maximalen Länge von Dateinamen des Hostsystems). In Wirklichkeit sind Unterseiten auch normale Seiten, die einen "/" im Namen enthalten und daher neben allen anderen Seiten im Dateisystem gespeichert werden. Unterseiten sind eine konfigurierbare Eigenschaft, sie sind allerdings standardmäßig eingeschaltet und es wird empfohlen, daß Sie das auch so beibehalten, da die Hilfeseiten auch diese Eigenschaft benutzen.

Verweise zu benachbarten Unterseiten fangen mit "`../`" an, z.B. ../UnterSeiten (ein Verweis auf diese Seite).

=== Beispiel ===
{{{
 * HilfeZumEditieren/UnterSeiten
 * [wiki:HilfeZumEditieren/UnterSeiten genau diese Seite]
 * [wiki:Self:HilfeZumEditieren/UnterSeiten genau diese Seite]
 * /DritteEbene
 * [wiki:/DritteEbene eine Seite unterhalb dieser hier]
 * ../UnterSeiten
 * ["../"] (anonymer Verweis zur übergeordneten Seite)
}}} 

=== Anzeige ===
 * HilfeZumEditieren/UnterSeiten
 * [wiki:HilfeZumEditieren/UnterSeiten genau diese Seite]
 * [wiki:Self:HilfeZumEditieren/UnterSeiten genau diese Seite]
 * /DritteEbene
 * [wiki:/DritteEbene eine Seite unterhalb dieser hier]
 * ../UnterSeiten
 * ["../"] (anonymer Verweis zur übergeordneten Seite)


/!\ Bitte tun Sie uns allen einen Gefallen und erzeugen Sie die /DritteEbene Seiten ''nicht'' einfach nur zum Ausprobieren!
