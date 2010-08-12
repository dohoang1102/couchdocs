## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:WikiSandBox
#format wiki
#language zh-tw
你可以在這裡盡情嘗試 wiki 的各項功能, 但是別把四個減號上面的說明改掉了...(就是本段!) 還有, 請 '''*不要*''' 只是因為想試試看, 就新增沒有內容/意義的頁面.

'''提示:''' 按住 Shift 鍵再點選 "HelpOnEditing" 就可以在另一個視窗裡打開編輯說明. IE 用戶請在 "HelpOnEditing" 上點右鍵, 選「在新視窗開啟」. Firefox 或 Mozilla 用戶可以試試用滑鼠中鍵, 在新的分頁中開啟.
----

== 文字格式 ==

''斜體'' '''粗體''' {{{非調和字}}}

`倒單引號帶出的非調和字` (這個功能可能會關掉)

~+ 放大 +~ ~- 縮小 -~

{{{
預先排好格式的段落
}}}

{{{#!Colorize python
def syntax(highlight):
    print "on"
    return None
}}}


== 連結 ==

HelpOnEditing MoinMoin:InterWiki ["中文的MoinMoin"]

http://purl.net/wiki/moin/ [http://www.python.org/ Python]

someone@the.inter.net


=== 圖片連結 ===
http://c2.com/sig/wiki.gif

== 清單 ==

=== 圓點 ===
 * 第一點
   1. 帶編號的巢狀清單
   1. 編號會一直往上加
 * 第二點
 * 第三點
   又見面了!
 縮排
   再縮排

=== 辭彙 ===
 專有名詞:: 定義

=== 畫圖 ===
drawing:mytest

= 標題 1 =
== 標題 2 ==
=== 標題 3 ===
==== 標題 4 ====
===== 特別的大小 =====

ПростоТест


= IRC 對話記錄測試 =

{{{#!Colorize irc
(23:18) <     jroes> ah
(23:19) <     jroes> hm, i like the way {{{ works, but i was hoping the lines would wrap
(23:21) -!- gpciceri [~gpciceri@host181-130.pool8248.interbusiness.it] has quit [Read error: 110 (Connection timed out)]
(23:36) < ThomasWal> you could also write a parser or processor
(23:38) <     jroes> i could?
(23:38) <     jroes> would that require modification on the moin end though?
(23:38) <     jroes> i cant change the wiki myself :x
(23:39) < ThomasWal> parsers and processors are plugable
(23:39) < ThomasWal> so you dont need to change the core code
(23:40) < ThomasWal> you need to copy it to the wiki data directory though
(23:40) <     jroes> well, what i meant to say was that i dont have access to the box running the wiki
(23:40) < ThomasWal> then this is no option awdsd asdasd sa asdasd sad asdadasds adasd asd asd asd asd asd a dadad ad adad ad asd asd adad asdasd asd adad as d
(23:40) <     jroes> yeah :/
}}}
drawing:mytest2
