## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:None
##master-date:None
#acl -All:write Default
#format wiki
#language en
HelpForAdministrators > HelpOnAdministration > HelpOnSpam

Wikispam is getting more and more annoying. Wiki pages get high ratings in search engines because of the strong linking between the pages (and each other via InterWiki links). This makes them a valuable target to increase the ranking of other pages

== Use TextChas ==
See HelpOnTextChas.

== Block Spam ==
You can ban certain content within contributions by listing regular expressions on the your 'BadContent' page.

If a user tries to save a page and its content matches any of these regular expressions, then saving that page will be denied (until the offending content is removed from the editor).

You can also enable an automatic update of BadContent via your wikiconfig. This is enabled by this line:
{{{
    from MoinMoin.security.antispam import SecurityPolicy
}}}
see HelpOnConfiguration/SecurityPolicy

== Remove Spam Action ==

If you are a <<HelpOnSuperUser|SuperUser>>, you can use this action to mass-revert changes of some spammer (or some other ''bad guy'').

 1. Select "Remove Spam" from the available actions.
 1. Select the user (usually part of the IP)
 1. Select "Revert All"
 1. You will see how moin tries to revert his edits. This does not work in every case, so you may have to clean up some of his edits manually.
