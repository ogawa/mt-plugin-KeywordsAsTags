# KeywordsAsTags プラグイン

投稿時にエントリーキーワードを「タグ」として登録するプラグイン。

## 更新履歴

 * 0.01 (2006-07-16 23:52:17 +0900):
   * 公開。
 * 0.02 (2007-08-31 12:27:38 +0900):
   * MT 4.0に対応しました。
   * プラグインの説明をローカライズしました。

## 概要

Movable Type 3.3でタグ機能がネイティブ対応されましたが、既存のXMLRPCやAtomPPを使ったブログ管理ツールからはこのタグ機能が利用できません。

KeywordsAsTagsプラグインは、これらのブログ管理ツールからも簡単にタグ登録できるように、エントリーキーワードに指定した文字列を自動的に3.3以降で実現された「タグ」に変換して登録する機能を提供します。

## 使い方

プラグインをインストールするには、パッケージに含まれるKeywordsAsTagsディレクトリをMovable Typeのプラグインディレクトリにアップロードもしくはコピーしてください。正しくインストールできていれば、Movable Typeのメインメニューに「KeywordsAsTags <version number>」が新規にリストアップされます。 

以降は、mt.cgiやXMLRPCなどを利用したブログ投稿ツールを使ってエントリーを投稿・更新する際に、自動的にエントリーキーワード欄の内容を「タグ」に変換して登録します。

現在のところキーワード欄とタグを完全に同期する手段は用意していません。単にエントリー保存時にキーワード欄の内容をパーズしてタグとして登録するだけなので「キーワード」→「タグ」の一方通行になります。例えば、MTのエントリー編集画面からタグを変更してもキーワードの内容は変更されません。

## タグ書式

エントリーキーワード欄に記述された文字列は自動的にタグとして認識されます。ブラケット[]、シングルクォート・ダブルクォートで囲まれた文字列は一個のタグとして認識します。また、「;,|」は区切り文字として機能します。キーワード欄に「;,|」が含まれない場合には空白文字が区切り文字として機能します。

下記の例はすべて「Movable Type」と「Plugin」という二個のタグとして認識します。

    "Movable Type" Plugin
    Movable Type, Plugin
    Movable Type|Plugin|
    [Movable Type][Plugin]

また、以下の例は「MT」と「Plugin」という二個のタグとして認識します。

    MT Plugin

## See Also

## License

This code is released under the Artistic License. The terms of the Artistic License are described at [http://www.perl.com/language/misc/Artistic.html](http://www.perl.com/language/misc/Artistic.html).

## Author & Copyright

Copyright 2006, Hirotaka Ogawa (hirotaka.ogawa at gmail.com)
