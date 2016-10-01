# このソフトウェアについて #

CreateRepository201610012001は、GitHubのローカルとリモートのリポジトリを作成するバッチファイル＆シェルスクリプトである。

# 開発環境 #

* Windows XP Pro SP3 32bit
    * cmd.exe
* [Git for Windows 1.9.4](https://github.com/msysgit/msysgit/releases/tag/Git-1.9.4-preview20140611)
* msys 2013072300
    * msys.bat(sh.exe)
    * [mingw-get.exe](https://sourceforge.net/projects/mingw/files/Installer/mingw-get-setup.exe/download)
* [cURL](https://curl.haxx.se/download.html#Win32) 7.24.0
    * [SSL証明書](http://curl.haxx.se/ca/cacert.pem)
* [nkf](http://www.vector.co.jp/soft/win95/util/se295331.html) 2.1.1 (2010-08-08)

cURL, nkfは環境変数のPathに追加する。

# 使い方 #

## 1. リポジトリ名にしたいディレクトリを用意する ##

任意のディレクトリの配下に、CallShell.bat、CreateRepository.sh、を配置する。

ディレクトリ名は半角英数字と`.`,`-`,`_`の文字だけにすること。
リモートリポジトリがその文字しか使えないため。

## 2. パラメータ設定 ##

パラメータを任意に設定する。

### CreateRepository.sh ###

* CURL_PEM="C:\Program Files\Git\ssl\certs\cacert.pem"
* GITHUB_USER="YourUsername"
* GITHUB_PASS="YourPassword"
* REPO_DESC="リポジトリの説明です。"
* REPO_HOME="https://www.google.co.jp"

### FirstPush.bat ###

* SET USER_NAME=YourUsername
* SET USER_MAIL=YourMail@domain.com
* SET SSH_HOST=github.com.YourUsername

## 3. FirstPush.batをダブルクリックする ##

GitHubでリモートリポジトリができ、ローカルリポジトリもできることを確認する。

# ライセンス #

このソフトウェアはCC0ライセンスです。

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.ja)
