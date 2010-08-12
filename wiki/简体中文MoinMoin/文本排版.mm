## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:MoinMoin/TextFormatting
##master-date:2004-11-20 22:54:58
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language zh

'''目录'''
<<TableOfContents(1)>>

= 章节 =
== 标题 2 ==
=== 标题 3 ===
==== 标题 4 ====
===== 标题 5 =====

在此页中我们尽量使用所有支持的标记至少一次。

正常文本, ''强调'', '''着重强调''', __下划线__, ,,下标,,, ^上标^, `打字机字体` 和{{{还是打字机字体}}}.

:) ;) :D {1} {de} {OK} (./)

= 链接 =

["简体中文MoinMoin"]

["简体中文MoinMoin/文本排版"]

["简体中文MoinMoin/安装手册"]

["../安装手册"]

["/子网页"]

[#anchorname 锚链]

http://moinmoin.wikiwikiweb.de/

[http://moinmoin.wikiwikiweb.de/]

[http://moinmoin.wikiwikiweb.de/ MoinMoin主页]

[http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png]

[http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png moinmoin.png]

Self:InterWiki

MeatBall:InterWiki

wiki:MeatBall/InterWiki

[wiki:MeatBall/InterWiki]

[wiki:MeatBall/InterWiki MeatBall上的InterWiki]

anyone@inter.net (如果您不介意垃圾邮件)

<<MailTo(first DOT last NOSPAM AT company DOT com)>> (垃圾邮件要少一些)

http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png


= 文本块 =

'''大段引用'''
 缩进
  更多

'''圆点列表'''
 * 条目1

 * 条目2, 中间分开
 * 条目3
   * 条目3.1

'''编号列表'''
 1. 条目1
   i. 条目1
   i. 条目2
 1. 条目2
   a. 条目1
   a. 条目2
##
 术语:: 描述
 分类:: 定义

'''源程序代码展示'''
 {{{
第一行
    缩进4个字符
}}}

'''表格'''
 一般格式及与HTML类似的选项
 ||||||<tablewidth="80%">'''标题'''||
 ||单元格 1||单元格 2||单元格 3||
 ||<rowspan=2> 单元格纵跨两行||||<bgcolor='#E0E0FF'> 横跨两列||
 ||<rowbgcolor="#FFFFE0">单元格 2||单元格 3||

 单元格宽度
 || 窄 ||<:99%> 宽 ||

 纵跨多行和横跨多列
 ||<|2> 占两行|| 第一行 ||
 || 第二行 ||
 ||<-2> 第三行纵跨两列 ||

 Alignment
 ||<(> 左对齐 ||<^|3> 上对齐 ||<v|3> 下对齐 ||
 ||<:> 居中 ||
 ||<)> 右对齐 ||

 颜色
 ||<#FF8080> 红旗飘飘 ||<#80FF80> 绿草如茵 ||<#8080FF> 蓝色爵士 ||


'''横线'''

--- (不是横线)
----
-----
------
-------
--------
---------
----------
-------------------------------------------- (横线宽度不会超过10)



= 宏 =

<<Anchor(anchorname)>>
'''<<PageCount>>''' 页数总计
<<RandomPage>> - 随便找了一页

= 处理插件 =

'''语法加亮'''
 {{{
#!python
# python 代码
print code.colorize("abc", 1 + 1)
}}}

'''CSV表格'''
 {{{#!CSV -2
第一列;第二列;第三列;第四列
1;2;3;4
a;b;c;d
}}}

此页的英文版本：MoinMoin/TextFormatting
