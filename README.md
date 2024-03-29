# 事前準備

- 本リポジトリはiCloud DriveのHOMEディレクトリにdotfilesという名前でcloneされることを前提としている  
  まだcloneしていなければ以下のコマンドでcloneする
  ```
  cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs
  git clone https://github.com/hoddy3190/dotfiles.git
  ```

# 環境セットアップ手順

以下を順番にやっていく。

## iCloudにログインする

- 「システム環境設定」から「iCloud」を選択し、ログインする
- 「iCloud Drive」と「メモ」と「Macを探す」にチェックをつける

## [Homebrew](https://brew.sh/index_ja)で必要なアプリケーションをインストール

- Homebrewのインストール&brew bundleの実行
  ```
  cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/dotfiles
  bash setup-homebrew.sh
  ```
  - 最初、Xcode Command Line Toolsのインストールのため、Returnキー押下とパスワードの要求をされるので、応じる
    ```
    ==> The Xcode Command Line Tools will be installed.    Press RETURN to continue or any other key to abort
    ==> /usr/bin/sudo /bin/chmod u+rwx /usr/local/bin /usr/local/lib
    Password:
    ```
  - karabiner-elementsをインストールする際、passwordとアプリケーションの実行許可を要求されるので、応じる
    ```
    Password:
    Installing karabiner-elements
    ```

## [mackup](https://github.com/lra/mackup)でrestoreする

- mackupコマンドをたたくのに必要な設定ファイルは先にシムリンクを貼っておく
  ```
  ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/dotfiles/.mackup.cfg $HOME/.mackup.cfg
  ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/dotfiles/.mackup $HOME/.mackup
  ```
- restoreコマンドをたたき、dotfiles内にある各設定ファイルのシムリンクを所定の場所に配置する
  ```
  mackup restore
  ```

## ログインシェルをzshにする

なぜ、手順の最初からzshに切り替えず、このタイミングでzshに切り替えるかというと、  
1つ前の手順の`mackup restore`をして初めて、zshの設定ファイル（環境変数が定義されたファイルも含む）がHOMEディレクトリ配置されるからである。  
次の手順で出てくるanyenvを使うためには、` eval "$(anyenv init -)" ` をログイン時に読み込んでおく必要がある。

- ` chsh -s /bin/zsh `
- ターミナルを閉じ、iTerm2を起動する

## 各言語のバージョン管理ツールをインストール

[anyenv](https://github.com/anyenv/anyenv)自体は、Homebrewですでにインストールされている。

- anyenvのmanifestのインストール&各言語のバージョン管理ツールをインストール
  - ` bash setup-anyenv.sh `

## 公開鍵/秘密鍵を生成する（次回環境構築時に、この作業をやるタイミングはここでいいのか、スクリプトにバグはないのかを検証する）

- 鍵の作成とssh-add
  - ` bash setup-ssh.sh `
- SDKMANのインストール
  - ` bash setup-sdkman.sh `

## Mac環境設定

```
bash .macos
```

「手動対応」と書かれているところ以外はすべて、[.macos](./.macos)で自動化されている。

- 一般
  - デフォルトのWebブラウザをChromeにする **（手動対応）**
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

## アプリケーション設定

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
    - その他変更する箇所はいくつかあるが、他はすべて自動化されている
      - [.macos](./.macos)参照
- iTerm2
  - General
    - Preferences
      - 「Load preferences from a custom folder or URL」にチェックを入れ、Browseで`$HOME/Library/Mobile Documents/com~apple~CloudDocs/dotfiles/Library/Preferences`を指定。
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
    - 「shell」と入力する
    - 「Shell Command: Install 'code' command in PATH」をクリック
  - 「EXTENSIONS」で「@recommended」と入力し、すべてインストール
    - mackupで共有している`$HOME/.vscode/extensions.json`が読み込まれている
- Alfred 3
  - Powerpack
    - PowerpackをActivateする
      - アクセシビリティの許可を求めてくるので、拒否する
  - Advanced
    - 「Syncing」の「Set preferences folder」を`$HOME/Library/Mobile\ Documents/com~apple~CloudDocs/dotfiles/Alfred`に設定
  - General
    - 「Alfred Hotkey」をctrl+Spaceに変更する
  - Features
    - 「Clipboard History」にて、「Keep Plain Text」と「Keep Images」と「Keep File Lists」にチェックをつける
    - 「Keep Plain Text」を「３ Months」に変更する
