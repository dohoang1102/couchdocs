## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl -All:write Default
#format wiki
#language en
== Help on Templates ==

Templates make it easier for users to add new pages. Instead of requiring that each bit of new information be added by hand, templates have some text and structure already filled in. <<HelpOnVariables|Variables>> can be used to insert date, time, creator, pagename, and the like.

A template page must be named with an ending fitting the standard template name ending (which defaults to some non-blank characters followed by "'''Template'''"). The administrator can change the default template name ending by setting "{{{page_template_regex}}}" in the configuration files. The new template page will be added to the list of template pages displayed when you try to show a non-existent page. For example, NonExistentHelpPage has a link to HelpTemplate that loads the content of HelpTemplate into the editor box, when you click on that link.

There are other default templates distributed with your !MoinMoin instance like a HomepageTemplate (for user homepages), a CategoryTemplate (for category pages, see  HelpOnCategories) or a SlideTemplate (for slides, see HelpOnSlideShows).
