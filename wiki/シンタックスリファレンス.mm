## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:SyntaxReference
##master-date:2004-12-17 23:03:18
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language ja
#pragma section-numbers off

{{{
#pragma section-numbers off
#acl All:admin,read,write,delete,revert
#language ja
}}}

このページには、サポートされている各マークアップの要素が、最低1度は使われているはずです。

{{{
'''インデックス'''
<<TableOfContents(2)>>
}}}
'''インデックス'''

<<TableOfContents(2)>>

= タイトル =
== タイトル2 ==
=== タイトル3 ===
==== タイトル4 ====
===== タイトル5 =====

= フォントスタイル =
{{{
通常のテキスト、''強調''、'''ストロング'''、__アンダーライン__、,,下付文字,,、^上付文字^、`タイプライター`、{{{タイプライター}}}。
}}}

通常のテキスト、''強調''、'''ストロング'''、__アンダーライン__、,,下付文字,,、^上付文字^、`タイプライター`、{{{タイプライター}}}。

== シンタックスハイライト ==
 {{{#!python
# python code
print code.colorize("abc", 1 + 1)
}}}

= 顔文字 =
<<ShowSmileys>>

= ハイパーリンク =
== 内部リンク ==
{{{
 * MoinMoin
 * MoinMoin/TextFormatting
 * MoinMoin/InstallDocs 
 * ../InstallDocs 
 * /SubPage
 * Self:InterWiki
}}}
 * MoinMoin
 * MoinMoin/TextFormatting
 * MoinMoin/InstallDocs 
 * ../InstallDocs 
 * /SubPage
 * Self:InterWiki

{{{
[#anchorname アンカーリンク]
}}}
[#anchorname アンカーリンク]

== 外部リンク ==
{{{
 * http://moinmoin.wikiwikiweb.de/
 * [http://moinmoin.wikiwikiweb.de/]
 * [http://moinmoin.wikiwikiweb.de/ MoinMoin Wiki]
 * [http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png]
 * http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png
 * [http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png moinmoin.png]
 * MeatBall:InterWiki
 * wiki:MeatBall/InterWiki
 * [wiki:MeatBall/InterWiki]
 * [wiki:MeatBall/InterWiki InterWiki page on MeatBall]
 * [file://servername/full/path/to/file/filename%20with%20spaces.txt Click here to read filename with spaces.txt]
 * me@privacy.net
}}}
 * http://moinmoin.wikiwikiweb.de/
 * [http://moinmoin.wikiwikiweb.de/]
 * [http://moinmoin.wikiwikiweb.de/ MoinMoin Wiki]
 * [http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png]
 * http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png
 * [http://moinmoin.wikiwikiweb.de/wiki/classic/img/moinmoin.png moinmoin.png]
 * MeatBall:InterWiki
 * wiki:MeatBall/InterWiki
 * [wiki:MeatBall/InterWiki]
 * [wiki:MeatBall/InterWiki InterWiki page on MeatBall]
 * [file://servername/full/path/to/file/filename%20with%20spaces.txt Click here to read filename with spaces.txt]
 * me@privacy.net
== Wiki名のエスケープ ==
{{{
Wiki''''''Name
Wiki``Name
}}}
Wiki''''''Name
Wiki``Name

= Blockquote =
{{{
 この行はインデントされています。
  さらにインデント。
}}}
 この行はインデントされています。
  さらにインデント。

= リスト =
{{{
 * アイテム1

 * アイテム2、ギャップ付
 * アイテム3
   * アイテム3.1
}}}
 * アイテム1

 * アイテム2、ギャップ付
 * アイテム3
   * アイテム3.1
= 数字付リスト =
{{{
 1. アイテム1
   i. アイテム1
   i. アイテム2
}}}
 1. アイテム1
   i. アイテム1
   i. アイテム2
{{{
 1. アイテム2
   a. アイテム1
   a. アイテム2
}}}
 1. アイテム2
   a. アイテム1
   a. アイテム2
= 言葉の説明や定義 =
{{{
 用語:: 説明
 ラベル:: 定義
}}}
 用語:: 説明
 ラベル:: 定義
= コード表示 =
 {{{
1行目
    4文字分インデント
}}}

= 表 =
== 通常の表レイアウトとHTML風のオプション ==
{{{
 ||||||<tablewidth="80%">'''タイトル'''||
 ||セル1||セル2||セル3||
 ||<rowspan=2> 行の連結||||<bgcolor='#E0E0FF'> 列の連結||
 ||<rowbgcolor="#FFFFE0">セル2||セル3||
}}}
 ||||||<tablewidth="80%">'''タイトル'''||
 ||セル1||セル2||セル3||
 ||<rowspan=2> 行の連結||||<bgcolor='#E0E0FF'> 列の連結||
 ||<rowbgcolor="#FFFFE0">セル2||セル3||

== セルの幅 ==
{{{
 || 狭い ||<:99%> 広い ||
}}}
 || 狭い ||<:99%> 広い ||

== 行の連結、列の連結 ==
{{{
 ||<|2> 2行 || 1行目 ||
 || 2行目 ||
 ||<-2> 2列にまたがった3行目 ||
}}}
 ||<|2> 2行 || 1行目 ||
 || 2行目 ||
 ||<-2> 2列にまたがった3行目 ||

== 表示位置 ==
{{{
 ||<(> 左 ||<^|3> 上 ||<v|3> 下 ||
 ||<:> 中央 ||
 ||<)> 右 ||
}}}
 ||<(> 左 ||<^|3> 上 ||<v|3> 下 ||
 ||<:> 中央 ||
 ||<)> 右 ||

== 色 ==
{{{
 ||<#FF8080> 赤 ||<#80FF80> 緑 ||<#8080FF> 青 ||
}}}
 ||<#FF8080> 赤 ||<#80FF80> 緑 ||<#8080FF> 青 ||

== CSVの表 ==
セミコロン(;)で区切られたデータ(「テキストの表示」を利用してください)
{{{
#!CSV -2
列1;列2;列3;列4
1;2;3;4
a;b;c;d
}}}
 {{{#!CSV -2
列1;列2;列3;列4
1;2;3;4
a;b;c;d
}}}

カンマ(,)で区切られたデータ(「テキストの表示」を利用してください)
{{{#!CSV ,
列1,列2,列3,列4
1,2,3,4
a,b,c,d
}}}

= 水平線 =
{{{
--- (これは水平線ではない)
----
-----
------
-------
--------
---------
----------
-------------------------------------------- (10よりも太くはならない)
}}}
--- (これは水平線ではない)
----
-----
------
-------
--------
---------
----------
-------------------------------------------- (10よりも太くはならない)

= マクロ =
{{{
<<Anchor(anchorname)>>
'''<<PageCount>>'''ページ
<<RandomPage>>
}}}
<<Anchor(anchorname)>>
'''<<PageCount>>'''ページ
<<RandomPage>>
