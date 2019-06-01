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
    - 最初からzshにするのではなく、なぜこのタイミングでzshに切り替えるかというと、mackup restoreで環境変数のファイルがHOMEに配置されたから
    - 例えば、以降のanyenvでは、` eval "$(anyenv init -)" ` をログイン時に読み込んでおく必要がある
+ 言語のバージョン管理ツールをインストール
  - ` bash setup-anyenv.sh `
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
    - ショートカット **（手動対応）**
      - LaunchpadとDock
        - すべてのチェックを外す
      - 入力ソース
        - すべてのチェックを外す
      - サービス
        - すべてのチェックを外す
      - スポットライト
        - すべてのチェックを外す
      - アプリケーション
        - すべてのチェックを外す
    - 入力ソース **（手動対応）**
      - 「+」マークを押し、「日本語」を選択
      - MacのDefault日本語IMEと、「ひらがな（Google）」を選択し、追加する
        - MacのDefault日本語IMEを選択する理由は、入力ソースとして最初から入っている「U.S.」を削除するため（なぜかこうしないと「U.S.」を削除できない）
      - 入力ソースとして最初から入っている「U.S.」を削除する
      - 「+」マークを押し、「英語」を選択
      - 「英数（Google）」を選択し、追加する
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
  - Karabiner-Elements
    - Karabiner-Elementsを起動させ、「キーボード設定アシスタント」（初回起動時のみ出現）に従ってキーを押す
    - 設定結果として、「ANSI（米国その他）」が選択されていることを確認し、「完了」を押す
    - 上でたたいた`mackup restore`コマンドにより、すでに、`~/.config/karabiner`に設定ファイルが配置されているので、設定が反映されていることを確認する。設定で行っていることは以下：
      - 「caps lock」と「left ctrl」を入れ替える
      - [rules](https://pqrs.org/osx/karabiner/complex_modifications/)から「For Japanese （日本語環境向けの設定）」をimport
      - 「Complex Modifications」の「Rules」に「コマンドキーを単体で押したときに、英数・かなキーを送信する。（左コマンドキーは英数、右コマンドキーはかな）」を追加
    - もし設定が反映されていないときは、公式ページの[The location of the configuration file](https://pqrs.org/osx/karabiner/document.html#configuration-file-path)を参考に、下のコマンドを打ち込む
      - ``$ launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server``  
  - Finder
    - 環境設定
      - サイドバー
        - よく使う項目
          - 「最近使った項目」のチェックを外す
          - 「ムービー」のチェックをつける
          - 「ピクチャ」のチェックをつける
          - 「HOME」のチェックをつける
      - 詳細
        - 「すべてのファイル名拡張子を表示」にチェックをつける
      - その他は自動化されている
        - [.macos](./.macos)参照
  - iTerm2
    - Preferences
      - Profiles
        - Colors
          - 「Color Presets」をMolokaiにする
        - Text
          - 「Font」のサイズを15pxにする
          - 「Non-ASCII Font」のサイズを15pxにする
  - Google 日本語入力
    - 一般
      - 「¥キーで入力する文字」を「\」にする
      - 「スペースの入力」を「半角」にする
    - 入力補助
      - 「アルファベット」の「変換前文字列」を半角にする
      - 「数字」の「変換前文字列」を半角にする
      - 「.,」の「変換前文字列」を半角にする
      - 「"'」の「変換前文字列」を半角にする
      - 「``#%&@$^_|`\``」の「変換前文字列」を半角にする
      - 「`<>=+-/*`」の「変換前文字列」を半角にする
  - Visual Studio Code
    - CLIでVisual Studio Codeを起動できるようにする
      - ` Cmd + Shift + P ` でコマンドパレットを開く
      - 「Shell Command: Install 'code' command in PATH」をクリック
  - Alfred 3
    - General
      - 「Alfred Hotkey」をctrl+Spaceに変更する
    - Powerpack
      - PowerpackをActivateする
        - アクセシビリティの許可を求めてくるので、拒否する
    - Advanced
      - 「Syncing」の「Set preferences folder」を`$HOME/Library/Mobile\ Documents/com~apple~CloudDocs/dotfiles/Alfred`に設定
