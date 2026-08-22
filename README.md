# 低予算ＣＡＥで遊ぼうのこーなー

## Overview
こちらはichmy55のサーバーgithub出張所の“低予算ＣＡＥで遊ぼうのこーなー”を公開するためのリポジトリです.<br>
本サイトの内容に、不具合などあった場合に気軽にコメントいただけるよう、ソースを公開します<br>
本サイトは,[github出張所](https://ichmy55.github.io/) にて公開しています.

## Installation
適当な作業ディレクトリを作成し,本ソースをcloneしてください.
```
$ git clone   --recursive https://github.com/ichmy55/ichmy55.github.io.git
```

## Directory tree
上記展開すると以下のようなディレクトリ構成になります.
<pre>
.
├── README.md.................説明書
├── Makefile..................テスト環境構築方法を記載したレシピファイル.
├── .github
│   └── workflow..............GitHubでのCI/CO設定ファイル.
├── markdown .................本リポジトリの説明書
│    
└── index.html ...............本文HTMLファイル
</pre>

## テスト表示方法
本ファイルをローカルでテストするために、ローカルにてApacheサーバーを立ち上げます
make一発で,docker環境の生成,docker環境へのソース転送,結果表示まで自動でやります．
表示は　http://localhost:8080 で表示します

## CI/CD
本リポジトリで使用するCI/CDにて使用するルールは [リンク先](markdown/CICD.md)にて説明しています
本リポジトリで使用する自動校正にて使用するルールは [リンク先](markdown/Textlint.md)にて説明しています

## Author

[ichmy55](https://github.com/ichmy55)

## Licence
"低予算ＣＡＥで遊ぼうのこーなー" の各ソースコードは [MIT license](https://ja.wikipedia.org/wiki/MIT_License) で配布します.  
また,このコードで生成されたファイルは,[クリエイティブ・コモンズ・ライセンス](https://ja.wikipedia.org/wiki/%E3%82%AF%E3%83%AA%E3%82%A8%E3%82%A4%E3%83%86%E3%82%A3%E3%83%96%E3%83%BB%E3%82%B3%E3%83%A2%E3%83%B3%E3%82%BA%E3%83%BB%E3%83%A9%E3%82%A4%E3%82%BB%E3%83%B3%E3%82%B9)表示4.0国際で配布します.
