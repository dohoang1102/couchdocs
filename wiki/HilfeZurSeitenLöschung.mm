## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnPageDeletion
##master-date:2002-01-03 12:02:54
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language de
HilfeInhalt > HilfeZurAdministration > HilfeZurSeitenLöschung

== Wie man Seiten löscht ==
Der immer funktionierende Weg, eine Seite zu löschen, ist über die Kommandozeile des Hostsystems. Die Seitendateien befinden sich im Verzeichnis "data/text" und der Administrator kann sie dort einfach löschen.

Normale Anwender können Seiten mit der {{{DeletePage}}}-Aktion löschen, insofern dies aktiviert ist (siehe HilfeZurKonfiguration und HilfeAllgemein/FragenUndAntworten). Beachten Sie, dass das Löschen einer Seite hier bedeutet, dass eine Sicherungskopie der Seite erstellt wird und danach die Seitendatei gelöscht wird. Dies entspricht also fast dem Speichern einer leeren Seite (was aber auf dem System nicht erlaubt ist).

Dies bedeutet, dass Sie selbst an gelöschte Seiten über Standard-Mechanismen wieder herankommen können, siehe auch den Eintrag "Can I restore a page from an older version?" auf der Seite HelpMiscellaneous/FrequentlyAskedQuestions. Insbesondere kann man auch den Seitennamen im `GoTo`-Dialog eingeben, sieht dann den üblichen Seitenerzeugungs-Dialog, kann dort dann aber auf `PageInfo` klicken und erhält dann die Versions-Historie der nur ''scheinbar'' gelöschten Seite, es sei denn, der Administrator hat inzwischen die Sicherungskopien gelöscht.
