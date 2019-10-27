#!/bin/bash -eu

# JVM: Java仮想マシン
# JRE: Javaアプリケーションを実行するために必要なソフトウェア
# JDK: Javaアプリケーションを開発するために必要なソフトウェア
# JVMはJREに含まれ、JREはJDKに含まれるという関係のため、
# JDKをインストールすれば、JRE、JVMもセットでインストールされる

# sdkmanをinstallする理由は下の通り
# 現状、JDKをinstallする手段は2つ
# - ` brew tap caskroom/versions; brew cask install java8 ` のようにバージョン指定でbrew install
# - SDKMANでインストール
# brewは、ツールのバージョン管理をすることが苦手なので、極力バージョン指定のインストールはしたくない
# SDKMANは、バージョン管理用途のツールであり、Javaだけでなく、kotlinやgradleといったenv系の存在しない言語・ツールのバージョン指定インストールにも対応できる

# しかし、rbenv等とは違い、SDKMANはプロジェクトごとのどのバージョンの言語を使うのかの指定ができない（インストール/アンインストールだけができる）ので、
# jenvと組み合わせて使う必要がある

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version
