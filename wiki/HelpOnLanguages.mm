## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en

= User interface texts and default_lang =

MoinMoin tries to adapt the user interface to the language the user prefers.

If the user puts a specific language preference into moin UserPreferences setting, that language will be used for the user interface. But the user doesn't even need to do that if he already has configured his browser with his language preferences.

If there is no specific `UserPreferences` language setting, moin tries to adapt to the languages the user configured in his browser. So if the browser tells moin that its preference is Canadian English, then German, then English in general and moin has German and English available (but not a specific configuration for Canadian English), then the user will get a German user interface.

If (and only if) there is no common language in the user's browser configuration and in moin, moin will fall back to using what is configured as default_lang. This is also the case if the user's browser does not specify any language.

= System pages, including FrontPage =

The MoinMoin distribution archive contains the system pages (like `RecentChanges`) in different languages (see SystemPagesGroup), selecting the correct language in the same way as for the user interface.

For example, if the navi_bar contains a link to `FrontPage`, moin will first look for a translation of `FrontPage` into the user's language. So if the user's language is German (de), we obtain the German translation of `FrontPage`, which is `StartSeite`. (Internally, moin uses `MoinMoin/i18n/de.py` for that, which is automatically generated out of `de.po`,) Moin will use `StartSeite` if that page actually exists; otherwise, it will fall back to using `FrontPage`.

This is fine if you want to have a FrontPage and translations of it. But what to do if you don't want that?

Either delete any translated page of FrontPage - they will only be used '''if they exist'''. Or simply use the `page_front_page` configuration variable to choose something different from `FrontPage` as your front page, e.g. `MyProject`. Moin will then try to look up a translation for `MyProject`, but usually won't find any - and thus simply use `MyProject` no matter what language the user prefers.

= Built-in vs. user-specified translations =

MoinMoin normally uses built-in translation (see `MoinMoin/i18n/*`) for translating user interface text and system page names in navi_bar.

But there is the possibility to customize navi_bar with your own stuff. Moin has no built-in translation for that usually, so what to do if you want to have them translated the same way as `FrontPage` usually is?

Simply create some pages like `GermanDict`, `FrenchDict`, etc. (use the english name of the language) and put a definition list on them which defines the translations for the English terms, e.g. on page `GermanDict`:
{{{
 MyProject:: MeinProjekt
 LatestNews:: NeuesteNachrichten
}}}

Moin then will use those dict pages if it can't find the text in its built-in translation dictionaries.

= How to specify the page language =

It is highly recommended to specify the page language in the page header like this:

{{{
#language he
}}}

The language name is the iso-639-1 name of the language. Languages that moin does not support are ignored.

This is critical if the wiki contains content in different directions, like Hebrew pages, which should display in right to left direction, and English pages, which should display in left to right direction.

In the past, system pages had a language comment: {{{##language:en}}}. This comment has no effect, and should be changed to the new {{{#language en}}} format. To repair old pages in your wiki, run {{{scripts.repair_language.py}}} in your wiki data directory. Back up your wiki data directory before doing this!

 (!) New in 1.3
