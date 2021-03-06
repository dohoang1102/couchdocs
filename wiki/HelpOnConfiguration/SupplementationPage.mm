## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl -All:write Default
#format wiki
#language en
= Supplementation Page =
Supplementation pages are just an additional pages that can be associated to your normal wiki pages by a link in the theme.

One usage of this feature is to have one "discussion page" additionally to each of your wiki pages. Then each wiki page will have a link to the "discussion page" by default.

== Configuration by the wiki admin ==

A wiki administrator can choose to enable this feature for all pages by putting this into wikiconfig:
{{{
    supplementation_page = True  # default is False
}}}

The name of the supplementation page and the template used for these pages can be set like this:
{{{
    supplementation_page_name = u'Discussion'  # this is the default
    supplementation_page_template = u'DiscussionTemplate'  # this is the default
}}}

== Control by the wiki user ==
A wiki user can control if he likes to have the supplementation feature on a per-page basis by using a processing instruction at the top of the page content:
{{{
#pragma supplementation-page on
}}}

Usage with '''off''' disables the feature on that page.

== Hints for using supplementation pages ==
 * Clean pages vs. good context:
  * You can use this to keep your wiki pages clean from discussions or comments (they shall be put on the supplementation page).
  * Separating discussions / comments has also some negative impact as you will have to provide context. If you don't do this, it might be unclear to what you are referring. If you could just comment ''near'' the context you are commenting, it would be less clean, but somewhat clearer/easier.
 * There is only one ''fixed'' supplementation_page_name (default: 'Discussion'):
  * If you just have a single language in your wiki, this is no big issue, you just set that page name to whatever you want. Either keep the default english name 'Discussion' or choose it wisely.
  * If you have multiple languages in your wiki, it is recommended to use a pagename that everybody can understand and be happy with (e.g. the english name 'Discussion', just keep the default).

There is also another, quite different "commenting feature" described on HelpOnComments.
