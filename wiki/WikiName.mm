## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en

A WikiName is a word that uses capitalized words. WikiName''''''s automagically become hyperlinks to the WikiName's page. What exactly is an uppercase or lowercase letter is determined by the configuration, the default configuration should work for UTF-8 characters.

When you click on the highlighted page title (i.e. WikiName on this page), you will see a list of all pages that link to the current page.  This even works on pages that are not defined yet.

A question mark before a link or a different rendering in bold red means that the page is not yet defined: you can click the question mark to offer a definition (e.g., NoSuchPageForReal). If you click on such a link, you will see a default page that you can edit; only after you save the page will it be created for real. A list of all pages that are not yet created but referred on another page is on WantedPages.

To ''escape'' a WikiName, i.e. if you want to write the word Wiki''''''Name without linking it, use an "empty" bold sequence (a sequence of six single quotes) like this: {{{Wiki''''''Name}}}. Alternatively, you can use the shorter sequence "{{{``}}}" (two backticks), i.e. {{{Wiki``Name}}}.

/!\ On some Wikis, a link to the page Recent``Changes might refer to the same page as this link: ["recentchanges"]. This is especially true for Windows and Mac OS X systems because they are not case-sensitive normally.

 * To learn more about wiki markup, see HelpOnEditing.
 * See also HelpOnLinking, "Arbitrary Page Names".
