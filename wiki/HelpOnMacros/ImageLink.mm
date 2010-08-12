## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl -All:write Default
#format wiki
#language en

<<Navigation(siblings)>>

<<BR>><<BR>>
/!\ The !ImageLink macro is gone since MoinMoin 1.6.1. 

It was replaced by better link/transclusion markup. The migration scripts converted all old content from 1.5 to the new syntax of 1.6, including replacing usage of !ImageLink macro by builtin new syntax. You can still get it from MoinMoin:MacroMarket if you insist on using it. If you used MoinMoin 1.6.0 and your users have added !ImageLink macro calls to the content of your wiki, please use full text search to locate them and replace them as you see below:

Old way:
{{{
<<ImageLink(image,target[,width=width[,height=height>>[,alt=alttag])>>
}}}

New way:
{{{
<<target|{{image|alt|width=123 height=456}}>>
}}}

You see, this is a quite natural way:
 * usually you write `<<target|text>>` when you want to use some text label
 * if you rather want an image "label", you just use the image markup instead of the text
 * the markup for showing (transcluding) an image is `{{image|alt|params}}`
