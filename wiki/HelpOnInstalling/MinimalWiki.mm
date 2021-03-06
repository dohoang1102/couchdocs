## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:
##master-date:
#acl -All:write Default
#format wiki
#language en
== Installing a minimal wiki ==
/!\ This configuration is unsupported by moin development. If you break it, you own the parts.

/!\ This instruction is based on Moin version 1.5.x .

If web space is small, or maybe if you only need a two or three wiki pages you might not want the global install. This document describes what is absolutely essential and what is not. It is good to understand the basic structure of the MoinMoin wiki and how the elements work together.


<<TableOfContents>>
=== htdocs / wiki ===

you will need at least one theme, you could delete the others. If you for instance want to delete the distributed 'classic' and 'rightsidebar' theme you have to  

 1. delete the folders with their names under htdocs 
 1. delete the scripts in !MoinMoin/theme which are named 'rightsidebar.py' and 'classic.py'

Sometimes the cache seems to need some time to update the view. To check if the styles are still available log in and go to !UserSettings.

If only one theme is served you can disable the themes choice by setting {{{theme_force=true}}} in the wikiconfig file.

=== MoinMoin binaries ===

You will need to have the "Moin``Moin" dir installed where all classes and scripts can be found. What macros and functions we do not need is more complicated, so yet no information about it here. 


=== Pages ===

The underlay dir per default contains the virgin system files. You can have an empty underlay directory. This must contain a subfolder "pages". If you have a wiki-farm, you might want to create an extra directory that you might call something like "underlay-barebones" and change the value for the {{{underlay_dir}}} of the specific wiki. You may want to have at least some essential pages like:

 * AutoAdminGroup
 * Category``Category
 * Category``Homepage
 * Category``Template
 * LocalBadContent
 * LocalSpellingWords
 * RecentChanges
 * SystemInfo (especially for testing)
 * SystemPagesGroup
 * SystemPagesInEnglishGroup


=== Languages ===

The languages are now attachments of the page SystemPagesSetup. Each language is packed as a ZIP file. Inside the ZIP file you find only numbers of the pages and a file MOIN_PACKAGE that describes what file number has which page name. These packages are thought to be installed via SystemPagesSetup. If you unpack them at home you will have to rename them and make the directories by hand. You could also install them in a new wiki and then copy them from the "pages" directory to the destination.

=== Configuration Options ===
You find all default values of the option in the file {{{MoinMoin/multiconfig.py}}}. 
If you want to show the user fewer options you can define this with the configuration values {{{ user_checkbox_defaults, user_checkbox_disable, user_checkbox_fields, user_checkbox_remove }}} (look at HelpOnConfiguration). 

==== checkbox minimum ====
with these checkbox fields you will not any get errors on calling user preferences

{{{
    user_checkbox_fields = [
    # needed fields:
        ('mailto_author', lambda _: _('Publish my email (not my wiki homepage) in author info')),
        ('show_nonexist_qm', lambda _: _('Show question mark for non-existing pagelinks')),
        ('show_page_trail', lambda _: _('Show page trail')),
        ('wikiname_add_spaces', lambda _: _('Add spaces to displayed wiki names')),
        ('edit_on_doubleclick', lambda _: _('Open editor on double click')),
        ('show_topbottom', lambda _: _('Show top/bottom links in headings')),
    # I want this one anyway:
        ('disabled', lambda _: _('Disable this account forever'))
    ]
    # if we have these fields, they need to have defaults:
    user_checkbox_defaults = {'mailto_author':       0,
                              'show_nonexist_qm':    0,
                              'show_page_trail':     1,
                              'wikiname_add_spaces': 0,
                              'edit_on_doubleclick': 0,
                              'show_topbottom':      0
                             }
}}}


==== Additional Remove Checkboxes ====

You can also remove some of these settings with {{{user_checkbox_remove}}}

{{{
   user_checkbox_remove = ['show_nonexist_qm', 'show_page_trail', 'wikiname_add_spaces', 'edit_on_doubleclick', 'show_topbottom', 'remember_last_visit']

}}}

=== Actions ===
You might want to disable some actions. To see what they actually do take a look at HelpOnActions. To see what actions are active take a look at your wikis page SystemInfo (if you did not delete it).

=== reduce wiki ===
If you want to reduce a data/ directory to the latest page revision of each non-deleted page (plus all attachments) you can use {{{moin ... maint reducewiki --target-dir=outputdir}}}. This is used to make the distributed underlay directory, but can also be used for other purposes.
