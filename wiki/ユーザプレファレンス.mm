## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:UserPreferences
##master-date:2004-12-17 23:03:18
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language ja
<<UserPreferences>>

= 初めての方へ =
'''<<GetText(Name)>>'''、'''<<GetText(Password)>>'''、'''<<GetText(Password repeat)>>'''、'''<<GetText(Email)>>'''を入力してください。

(!) 「名前」には["Wiki名"](Firstname``Lastname形式の文字列)を利用するとよいでしょう。このようにすると、["Wikiホームページ"]へのリンクが自動的に生成されます。また、ログインするための情報を忘れてしまった際、この情報をメールで受け取ることができます。そのため、メールアドレスの入力は必須になっています。

「'''<<GetText(Create Profile)>>'''」をクリックするとユーザプロファイルが作成され、ログインすることができます。

= ログイン =
再度ログインする際には、'''<<GetText(Name)>>'''と'''<<GetText(Password)>>'''を入力し、「'''<<GetText(Login)>>'''」をクリックしてください。 パスワードを忘れてしまった場合には、メールアドレスを入力し、「'''<<GetText(Mail me my account data)>>'''」をクリックしてください。

= 設定の変更 =
「'''<<GetText(Save)>>'''」をクリックすると、プロファイルが更新されます。結果はWikiサーバに保存されます。

= ログアウト =
「'''<<GetText(Logout)>>'''」をクリックすると、ログイン時に作成されたクッキーが削除されます。

= クッキー =
/!\ Wikiサーバからの応答に含まれる"ID"が、クッキーとしてブラウザに保存されます。これによって、ログインが完了した状態であることをWikiサーバが知ることができます。クッキーは深夜0時に期限切れになります(ただし「'''<<GetText(Remember login information)>>'''」にチェックを入れた場合には、期限切れにはなりません)。
