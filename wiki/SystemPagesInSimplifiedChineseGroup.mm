## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
<<TableOfContents()>>

= 注意事项 =

/!\ 本页第一层列表仅用于中文系统页的链接名. 请不要在这层列表中使用任何语言旗标, 原英文名和注释 - 最好把这些东西放到第二层列表上. 只有在第一层列表只包含中文系统页链接名时, 这个中文翻译组页才能被Moin很好地派上用场. 这一页上也不能把第一层列表用于别的用途. -- 英文原文自ThomasWaldmann <<DateTime(2004-11-27T12:16:52Z)>>

请注意在翻译的文本前加上（以["最新改动"]为例):
{{{
#language zh
##master-page:RecentChanges
##master-date:2004-05-11 19:27:40
}}}

如果某一页已经完全翻译成简体中文, 请在该页的最后注明其英文原文以便用户参考, 比如:
{{{
此页的英文版本：RecentChanges
}}}

= 统一词汇表 =

{{{#!CSV
page; 网页; ==== 备 注 ====
size; 大小
site; 站点
wiki; 维基
homepage; 个人网页
Help*; 帮助*
HelpOn*; 帮助-*
link; 链接
edit; 编辑
change; 改动
template; 模板
category; 分类
Category*; *类
login; 登录
logout; 登出
user; 用户
password; 密码
account,profile; 帐号
info, information; 信息
}}}

= 翻译进度 =

This is a list of all english System``Pages (including Help``Pages) in this wiki, 大家一起来把它们翻成简体中文:

下面的列表中
|| {en} ||只是刚从英文拷贝过来，没有翻译||simply copied from the english version, without any translation ||
|| {en} {zh} || 翻译了一部分 || partially translated ||
|| {zh} || 翻译完成 || completely translated ||
|| {1} || 简单地将英文版本通过Include包含在中文版本中。等于没翻。||simply put the english version into the chinese version via Include, nothing has been really transtalted ||
|| {1} {zh} || 简单地将英文版本通过Include包含在中文版本中，外加一些中文说明。||simply put the english version into the chinese version via Include, with some chinese explanation ||
|| {X} || 英文原文不存在，没办法翻。||english version doesn't exist, can't translate||
|| 其它 Others ||还没开始||nothing has been done||

== 系统网页 ==
 * ["最新改动"]
  * {zh} RecentChanges
 * ["标题索引"]
  * {zh} TitleIndex
 * ["标题索引"]
  * {zh} TitleIndex
 * ["词汇索引"]
  * {zh} WordIndex
 * ["站点导航"]
  * {zh} SiteNavigation
 * ["查找网页"]
  * {zh} FindPage
 * ["用户设置"]
  * {zh} UserPreferences
 * ["需要网页"]
  * {zh} MissingPage
 * ["废弃网页"]
  * {zh} AbandonedPages
 * ["孤立网页"]
  * {zh} OrphanedPages
 * ["待建网页"]
  * {zh} WantedPages
 * ["事件统计"]
  * {zh} EventStats
 * ["事件统计/访问量"]
  * {zh} EventStats/HitCounts
 * ["事件统计/用户代理"]
  * {zh} EventStats/UserAgents
 * ["网页大小"]
  * {zh} PageSize
 * ["网页流量"]
  * {zh} PageHits
 * ["维基链"]
  * {zh} InterWiki
 * ["随机网页"]
  * {zh} RandomPage
 * ["系统信息"]
  * {zh} SystemInfo
 * ["系统网页组"]
  * {1} SystemPagesGroup
 * ["维基个人网页"]
  * {zh} WikiHomePage
 * ["维基链接名"]
  * {zh} WikiName
 * ["维基沙盘演练"]
  * {zh} WikiSandBox
 * ["维基网"]
  * {zh} WikiWikiWeb
 * ["维基好坏说"]
  * {1} {zh} WhyWikiWorks
 * ["Xslt版本信息"]
  * {zh} XsltVersion
 * ["简体中文MoinMoin"]
  * {zh} MoinMoin
 * ["简体中文MoinMoin/文本排版"]
  * {zh} MoinMoin/TextFormatting
  * ["首页"]
   * {zh} FrontPage : - do not move this to 1st level as we do not want to update this page!
 * ["名言警句"]
  * {zh} FortuneCookies

== 帮助网页 ==
 * ["帮助目录"]
  * {1} {zh} HelpContents
 * ["帮助-新手入门"]
  * {1} HelpForBeginners
 * ["帮助-开发指南"]
  * HelpForDevelopers
 * ["帮助索引"]
  * {zh} HelpIndex
 * ["帮助-其他"]
  * HelpMiscellaneous
 * ["帮助-其他/试验性的功能"]
  * HelpMiscellaneous/ExperimentalFeatures
 * ["帮助-其他/常见问题解答"]
  * {1} HelpMiscellaneous/FrequentlyAskedQuestions
 * ["帮助-访问权限控制表"]
  * {zh} HelpOnAccessControlLists
 * ["帮助-操作"]
  * HelpOnActions
 * ["帮助-附件"]
  * HelpOnActions/AttachFile
 * ["帮助-系统管理"]
  * HelpOnAdministration
 * ["帮助-系统设置"]
  * {1} {zh} HelpOnConfiguration
 * ["帮助-系统设置/层叠样式表"]
  * HelpOnConfiguration/CascadingStyleSheets
 * ["帮助-系统设置/邮件支持"]
  * HelpOnConfiguration/EmailSupport
 * ["帮助-系统设置/安全策略"]
  * HelpOnConfiguration/SecurityPolicy
 * ["帮助-编辑锁定"]
  * HelpOnEditLocks
 * ["帮助-编辑"]
  * {zh} HelpOnEditing
 * ["帮助-编辑/子网页"]
  * {en} {zh} HelpOnEditing/SubPages
 * ["帮助-排版"]
  * {zh} HelpOnFormatting
 * ["帮助-标题"]
  * HelpOnHeadlines
 * ["简体中文MoinMoin/安装手册"]
  * {1} MoinMoin/InstallDocs
 * ["帮助-安装"]
  * HelpOnInstalling
 * ["帮助-安装/Apache和MacOsx "]
  * HelpOnInstalling/ApacheOnMacOsx
 * ["帮助-安装/Apache和Linux"]
  * HelpOnInstalling/ApacheOnLinux
 * ["帮助-安装/Apache和Win32"]
  * HelpOnInstalling/ApacheOnWin32
 * ["帮助-安装/Apache和FastCgi"]
  * HelpOnInstalling/ApacheWithFastCgi
 * ["帮助-安装/Apache和ModPython"]
  * HelpOnInstalling/ApacheWithModPython
 * ["帮助-安装/基本安装"]
  * HelpOnInstalling/BasicInstallation
 * ["帮助-安装/InternetInformationServer"]
  * HelpOnInstalling/InternetInformationServer
 * ["帮助-安装/独立服务"]
  * HelpOnInstalling/StandaloneServer
 * ["帮助-安装/问题解答"]
  * HelpOnInstalling/TroubleShooting
 * ["帮助-安装/TwistedWeb"]
  * HelpOnInstalling/TwistedWeb
 * ["帮助-安装/WebLogic"]
  * HelpOnInstalling/WebLogic
 * ["帮助-安装/维基Farm"]
 * ["帮助-安装/创建维基例程"]
  * HelpOnInstalling/WikiInstanceCreation
 * ["帮助-语言"]
  * {1} HelpOnLanguages
 * ["帮助-链接"]
  * {1} HelpOnLinking
 * ["帮助-列表"]
  * HelpOnLists
 * ["帮助-宏"]
  * {1} HelpOnMacros
 * ["帮助-宏/Include"]
  * ["HelpOnMacros/Include"]
 * ["帮助-宏/MailTo"]
  * HelpOnMacros/MailTo
 * ["帮助-导航"]
  * HelpOnNavigation
 * ["帮助-新建网页"]
  * HelpOnPageCreation
 * ["帮助-删除网页"]
  * HelpOnPageDeletion
 * ["帮助-分析插件"]
  * {en} HelpOnParsers
 * ["帮助-处理指令"]
  * HelpOnProcessingInstructions
 * ["帮助-处理插件"]
  * HelpOnProcessors
 * ["帮助-横线"]
  * HelpOnRules
 * ["帮助-搜索"]
  * HelpOnSearching
 * ["帮助-换肤"]
  * HelpOnSkins
 * ["帮助-放映幻灯片"]
  * {en} {zh} HelpOnSlideShows
 * ["帮助-放映幻灯片/000 前言"]
  * {en}  ["HelpOnSlideShows/000 Introduction"]
 * ["帮助-放映幻灯片/100 创建幻灯片"]
  * {en} {zh} ["HelpOnSlideShows/100 Creating the slides"]
 * ["帮助-放映幻灯片/900 最后: 放映开始"]
  * {en} {zh} ["HelpOnSlideShows/900 Last but not least: Running your presentation."]
 * ["帮助-笑脸"]
  * HelpOnSmileys
 * ["帮助-拼写检查"]
  * HelpOnSpellCheck
 * ["帮助-表格"]
  * HelpOnTables
 * ["帮助-主题"]
  * HelpOnThemes
 * ["帮助-升级"]
  * HelpOnUpdating
 * ["帮助-升级Python"]
  * HelpOnUpdatingPython
 * ["帮助-用户设置"]
  * HelpOnUserPreferences
 * ["帮助-XML网页"]
  * HelpOnXmlPages
 * ["帮助-模板"]
  * HelpTemplate
 * ["语法参考"]
  * {1} SyntaxReference

== 维基教程 ==
 * ["维基教程"]
  * WikiCourse
 * ["维基教程/简介"]
  * WikiCourse/BasicIntroduction
 * ["维基教程/简介/000 维基是什么?"]
  * ["WikiCourse/BasicIntroduction/000 What is a Wiki?"]
 * ["维基教程/简介/050 迈出第一步"]
  * ["WikiCourse/BasicIntroduction/050 First Steps"]
 * ["维基教程/简介/060 如何浏览"]
  * ["WikiCourse/BasicIntroduction/060 How do I navigate?"]
 * ["维基教程/简介/090 编辑器"]
  * ["WikiCourse/BasicIntroduction/090 The Editor"]
 * ["维基教程/简介/091 使用编辑器的技巧"]
  * ["WikiCourse/BasicIntroduction/091 Tips on the Editor"]
 * ["维基教程/简介/100 文本标记"]
  * ["WikiCourse/BasicIntroduction/100 Text markup"]
 * ["维基教程/简介/110 标题和段落"]
  * ["WikiCourse/BasicIntroduction/110 Headlines and Paragraphs"]
 * ["维基教程/简介/130 列表"]
  * ["WikiCourse/BasicIntroduction/130 Lists"]
 * ["维基教程/简介/150 表格"]
  * ["WikiCourse/BasicIntroduction/150 Tables"]
 * ["维基教程/简介/151 宏"]
  * ["WikiCourse/BasicIntroduction/180 Macros"]
 * ["维基教程/简介/191 创建新网页"]
  * ["WikiCourse/BasicIntroduction/191 Creating new Pages"]
 * ["维基教程/简介/195 操作"]
  * ["WikiCourse/BasicIntroduction/195 Actions"]
 * ["维基教程/简介/200 维基风度"]
  * ["WikiCourse/BasicIntroduction/200 Wikiquette"]
 * ["维基教程/简介/210  组织和结构"]
  * ["WikiCourse/BasicIntroduction/210 Organisation and Structure"]
 * ["维基教程/简介/900 练习"]
  * ["WikiCourse/BasicIntroduction/900 Exercises"]
 * ["维基教程/简介讲义"]
  * ["WikiCourse/BasicIntroductionHandOut"]

== 分类 ==
 * ["网页分类"]
  * {zh} CategoryCategory
 * ["个人网页类"]
  * {zh} CategoryHomepage

== 模板 ==
 * ["帮助模板"]
  * {zh} HelpTemplate
 * ["个人网页模板"]
  * {zh} HomepageTemplate
 * ["幻灯讲义模板"]
  * {zh} SlideShowHandOutTemplate
 * ["幻灯放映模板"]
  * {zh} SlideShowTemplate
 * ["幻灯片模板"]
  * {zh} SlideTemplate
