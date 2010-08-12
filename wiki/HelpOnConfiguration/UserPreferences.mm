## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl -All:write Default
#format wiki
#language en
You can predefine, disable or remove several options on the user preferences page using the following parameters in your wiki config:

|| user_checkbox_defaults || dict || Sets the default settings of the user preferences checkboxes. Example: `user_checkbox_defaults = {'edit_on_doubleclick': 0}` ||
|| user_checkbox_disable || `[]` || a list of checkbox names to be disabled in the user preferences. A disabled checkbox is displayed greyedout and uses the default value set in `user_checkbox_defaults`. ||
|| user_checkbox_fields || `[...]` || list of checkbox items. ||
|| user_checkbox_remove || `[]` || a list of checkbox names to be removed from the user preferences. A removed checkbox uses the default value set in `user_checkbox_defaults`.||
|| user_form_defaults|| `[]` || a list of form defaults for user preferences.||
|| user_form_disable || `[]` || a list of form field names to be disabled in the user preferences. A disabled field is displayed greyed out and uses the default value set in `user_form_defaults`.||
|| user_form_fields || `[...]` || list of user preferences form items. ||
|| user_form_remove || `[]` || a list of form field names to be removed from user preferences. A removed form field uses the default value set in `user_form_defaults`.||

The possible keys / clear text explanations are found in `MoinMoin/config/multiconfig.py`:

|| mailto_author || Publish my email (not my wiki homepage) in author info ||
|| edit_on_doubleclick || Open editor on double click ||
|| remember_last_visit || After login, jump to last visited page ||
|| show_comments || Show comment sections ||
|| show_nonexist_qm || Show question mark for non-existing pagelinks ||
|| show_page_trail || Show page trail ||
|| show_toolbar || Show icon toolbar ||
|| show_topbottom || Show top/bottom links in headings ||
|| show_fancy_diff ||Show fancy diffs ||
|| wikiname_add_spaces || Add spaces to displayed wiki names ||
|| remember_me || Remember login information ||
|| want_trivial || Subscribe to trivial changes ||
|| disabled || Disable this account forever ||

So you could do, for example:

user_checkbox_remove = ['edit_on_doubleclick', 'show_nonexist_qm', 'show_toolbar', 'show_topbottom', 'show_fancy_diff', 'wikiname_add_spaces', 'remember_me', 'disabled',]

user_form_remove = ['password', 'password2', 'css_url', 'logout', 'create', 'account_sendmail', 'aliasname',]
