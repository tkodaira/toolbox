# try.sh

## 概要
ファイル名に含まれる日付をTSVファイルの末尾のカラムとして付与するツールです

## 使い方
`try.sh`とtsvファイルは同じディレクトリにおいてください
- 単一ファイルの場合
```
$ sh try.sh <file> 
add date column done. ./formatted/<file>
```
実行したディレクトリ直下に　`formatted/file を作成します。

- 複数ファイルまとめてやる場合
以下のように実行します。
```
$ ls *.tsv
test1_20191207.tsv
test2_20191201.tsv
try.sh

$ ls  *.tsv | xargs -n 1 sh ./try.sh
add date column done. ./formatted/test1_20191207.tsv
add date column done. ./formatted/test1_20191207.tsv
```
