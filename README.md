# usage
Input the following codes to use it.

```
cd ~
git clone https://github.com/hoddy3190/dotfiles.git
./dotfiles/setup.sh
```

# flow

1. あらゆる設定ファイルの本体はすべてiCloud上に保存
2. iCloud上にある本体設定ファイルのシムリンクをアプリケーションごとに特定の場所につくって利用する

# 環境セットアップ手順

「手動対応」と書かれているところ以外はすべて自動化されている。

+ iCloudにログインする
  - 「システム環境設定」から「iCloud」を選択し、ログインする
  - 「iCloud Drive」と「メモ」と「Macを探す」にチェックをつける
  - まだ本リポジトリをcloneしていなければ、iCloud Drive内に本リポジトリをdotfilesという名前でclone
    ```
    cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs
    git clone https://github.com/hoddy3190/dotfiles.git
    ```
+ 必要なアプリケーションをインストール
  - homebrewのインストール&brew bundleの実行
    - ```
      cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/dotfiles
      bash setup-homebrew.sh
      ```
    - 最初、Xcode Command Line Toolsのインストールのため、Returnキー押下とパスワードの要求をされるので、応じる
      ```
      ==> The Xcode Command Line Tools will be installed.

      Press RETURN to continue or any other key to abort
      ==> /usr/bin/sudo /bin/chmod u+rwx /usr/local/bin /usr/local/lib
      Password:
      ```
    - karabiner-elementsをインストールする際、passwordとアプリケーションの実行許可を要求されるので、応じる
      ```
      Password:
      Installing karabiner-elements
      ```
+ mackupでrestoreする
  - ```
    ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/dotfiles/.mackup.cfg $HOME/.mackup.cfg
    ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/dotfiles/.mackup $HOME/.mackup
    mackup restore
    ```
+ ログインシェルをzshにする
  - ` chsh -s /bin/zsh `
  - ターミナルを閉じ、iTerm2を起動する
+ 環境構築
  - [anyenv](https://github.com/anyenv/anyenv)を使って、各言語のバージョン管理ツールをインストール
+ Mac環境設定
  - 一般
    - デフォルトのWebブラウザをChromeにする
      - defaultsコマンドでのやり方が不明なので、これは手動で設定する
    - 「このMacとiCloudデバイス間でのHandoffを許可」のチェックを外す
  - Dock
    - 「サイズ」を調整する
    - 「拡大」にチェックをつける
    - 「拡大」を調整する
    - 「画面上の位置」を左にする
    - 「ウインドウをしまうときのエフェクト」をスケールエフェクトにする
    - 「ウインドウをアプリケーションアイコンにしまう」にチェックをつける
    - 「Dockを自動的に表示/非表示」にチェックをつける
  - 省エネルギー **（手動対応）**
    - バッテリー
      - 「ディスプレイをオフにするまでの時間」を10分にする
      - 「可能な場合はハードディスクをスリープさせる」のチェックを外す
  - キーボード
    - キーボード
      - 「キーのリピート」の調整
      - 「リピート入力認識までの時間」の調整
    - ユーザ辞書
      - 「英字入力中にスペルを自動変換」のチェックを外す
      - 「文頭を自動的に大文字にする」のチェックを外す
      - 「スペースバーを2回押してピリオドを入力」のチェックを外す
      - 「スマート引用符とスマートダッシュを使用」のチェックを外す
    - 入力ソース **（手動対応）**
      - MacのDefault日本語入力IMEに変更する
      - 候補表示のフォントを「游ゴシック体 ミディアム」にする
      - フォントサイズを12にする
      - "/"キーで入力する文字を「/」にする
      - "￥"キーで入力する文字を「\」にする
      - 「数字を全角入力」のチェックを外す
  - トラックパッド **（手動対応）**
    - ポイントとクリック
      - 「調べる&データ検出」を「3本指でタップ」にする
      - 「タップでクリック」にチェックをつけ「1本指でタップ」にする
    - その他のジェスチャ
      - 「アプリケーションExpose」にチェックをつける
  - 日付と時刻
    - 月日曜日HMSを表示させる
  - ユーザとグループ **（手動対応）**
    - ログイン項目に以下を追加
      - Alfred 3
      - Karabiner
  - アクセシビリティ **（手動対応）**
    - ディスプレイ
      - カーソルのサイズを調整する
+ アプリケーション設定
  - Karabiner
    - 「caps lock」と「left ctrl」を入れ替える
    - [rules](https://pqrs.org/osx/karabiner/complex_modifications/)から「For Japanese （日本語環境向けの設定）」をimport
    - 「Complex Modifications」の「Rules」に「コマンドキーを単体で押したときに、英数・かなキーを送信する。（左コマンドキーは英数、右コマンドキーはかな）」を追加
  - Finder
    - 環境設定
      - 一般
        - 「新規Finderウィンドウで次を表示」のところをHOMEディレクトリにする
      - サイドバー
        - よく使う項目
          - 「最近使った項目」のチェックを外す
          - 「ムービー」のチェックをつける
          - 「ピクチャ」のチェックをつける
          - 「HOME」のチェックをつける
        - タグ
          - 「最近使ったタグ」のチェックを外す
      - 詳細
        - 「すべてのファイル名拡張子を表示」にチェックをつける
        - 「拡張子を変更する前に警告を表示」のチェックを外す
        - 検索実行時を「現在のフォルダ内を検索」にする
    - sync対象
      - com.apple.finder.plist
  - iTerm2
    - [TODO]その他書き加える
