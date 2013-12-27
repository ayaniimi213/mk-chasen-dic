mk-chasen-dic
============
はてなキーワードとwikipediaのタイトルリストからchasenの辞書を作成する

- はてなキーワード http://d.hatena.ne.jp/images/keyword/keywordlist_furigana.csv
- wikipediaタイトルリスト http://dumps.wikimedia.org/jawiki/latest/

* 必要なライブラリ
---
- Ruby
- nkf

* 手順
** はてなキーワード

````bash
$ wget http://d.hatena.ne.jp/images/keyword/keywordlist_furigana.csv
$ ruby mk-hatena-dic.rb keywordlist_furigana.csv hatena.dic
````

chasenの文法定義ファイルを用意する。
- grammar.cha - 品詞定義ファイル
- ctypes.cha - 活用型定義ファイル
- cforms.cha - 活用形定義ファイル
- connect.cha - 連接表定義ファイル

makedaコマンドを使い辞書をコンパイルする。makedaコマンドは文法定義ファイルのあるディレクトリで行うこと。
````bash
$ makeda -i w hatena hatena.dic
````


** wikipediaのタイトルリスト

````bash
$ wget http://dumps.wikimedia.org/jawiki/latest/jawiki-latest-all-titles-in-ns0.gz
$ gunzip jawiki-latest-all-titles-in-ns0.gz
$ ruby mk-jawikipedia-dic.rb jawiki-latest-all-titles-in-ns0 > jawikipedia.dic
````

chasenの文法定義ファイルを用意する。
- grammar.cha - 品詞定義ファイル
- ctypes.cha - 活用型定義ファイル
- cforms.cha - 活用形定義ファイル
- connect.cha - 連接表定義ファイル

makedaコマンドを使い辞書をコンパイルする。makedaコマンドは文法定義ファイルのあるディレクトリで行うこと。
````bash
$ makeda -i w jawikipedia jawikipedia.dic
````

* 実装
形態素生起コストとは適当に5000, 読みはひらがなをカタカナに直しただけです。
コストは再考の余地ありですが、読みはどうせ使わないでしょうから適当に実装しました。



* 参考
ChaSen's Wiki - 辞書の作り方 http://chasen.naist.jp/hiki/ChaSen/?%BC%AD%BD%F1%A4%CE%BA%EE%A4%EA%CA%FD
