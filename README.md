# usage
Input the following codes to use it.

```
cd ~
git clone https://github.com/altitude3190/dotfiles.git
./dotfiles/setup.sh
```

# flow

1. あらゆる設定ファイルの本体はすべてiCloud上に保存
2. iCloud上にある本体設定ファイルのシムリンクをアプリケーションごとに特定の場所につくって利用する

# 環境セットアップ手順

以下の手順はすべて自動化されている。

+ 本リポジトリをclone
+ 必要なアプリケーションをインストール
  - homebrewのインストール
    - ` /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" `
  - `.Brewfile` のシムリンクをHOMEディレクトリに配置
  - ` brew bundle --global `
+ 環境構築
  - [anyenv](https://github.com/anyenv/anyenv)を使って、各言語のバージョン管理ツールをインストール
+ Mac環境設定
  - 一般
    - デフォルトのWebブラウザをChromeにする
  - Dock
    - 画面上の位置を左にする
    - [TODO]その他書き加える
  - キーボード
    - ユーザ辞書
      - 「英字入力中にスペルを自動変換」のチェックを外す
      - 「スマート引用符とスマートダッシュを使用」のチェックを外す
  - トラックパッド
    - [TODO]その他書き加える
  - サウンド
    - 「メニューバーに音量を表示」のチェックをつける
  - 日付と時刻
    - 月日曜日HMSを表示させる
  - ユーザとグループ
    - ログイン項目に以下を追加
      - Alfred 3
      - Karabiner
+ アプリケーション設定
  - Karabiner
    - 「caps lock」を「left ctrl」に変える
    - [TODO]その他書き加える
  - Finder
    - 環境設定
      - 一般
        - 「新規Finderウィンドウで次を表示」のところをHOMEディレクトリにする
      - サイドバー
        - [TODO]その他書き加える
      - 詳細
        - 「すべてのファイル名拡張子を表示」にチェックをつける
  - iTerm2
    - [TODO]その他書き加える
  
