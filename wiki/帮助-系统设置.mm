## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:HelpOnConfiguration
##master-date:2004-11-18 23:59:40
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language zh

我们简单地把英文的系统设置帮助包含在这里, 如果您有时间, 请帮忙翻译成简体中文。为了正确地使用简体中文，除了英文系统必要的一些设置外，还需要在{{{wikiconfig.py}}}中设置如下的选项：
{{{#!CSV
变量名; 缺省; 中文系统支持
page_category_regex; u'^Category[A-Z]'; u'^Category[A-Z]|类$'
page_template_regex; u'[a-z]Template$'; u'[a-z]Template$|模板$'
page_dict_regex; u'[a-z]Dict$'; u'[a-z]Dict$|字典$'
page_form_regex; u'[a-z]Form$'; u'[a-z]Form$|表$'
page_group_regex; u'[a-z]Group$'; u'[a-z]Group$|组$'
}}}

<<Include(HelpOnConfiguration)>>

此页的英文版本：HelpOnConfiguration
