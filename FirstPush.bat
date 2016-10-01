:: -----------------------------------------------------------------------------
:: ローカルリポジトリとリモートリポジトリを新規作成して初commit→pushする
:: -----------------------------------------------------------------------------
:: 内容
:: * リモート･リポジトリを新規作成する（リポジトリ名はこのファイルの親ディレクトリ名）
:: * git init
:: * git add .
:: * git commit
:: * git push
:: 
:: 事前準備
:: * SSH公開鍵をGitHubに設定する
:: 
:: 手順
:: 1. Git for Windows をインストールする
:: 2. ssh鍵を作成する
::     2.1. 以下のパスへ移動する
::         C:\Documents and Settings\Administrator\.ssh
::     2.2. ssh鍵を作成する
::         GitBash > ssh-keygen -t rsa -C "your_email@domain.com" -f filename
::         * 以下の2ファイルが生成される
::             * 秘密鍵ファイル(filename)
::             * 公開鍵ファイル(filename.pub)
::         * configファイルに以下を追記する
::            Host github.com.filename
::              User git
::              Port 22
::              HostName github.com
::              IdentityFile ~/.ssh/filename
::              TCPKeepAlive yes
::              IdentitiesOnly yes
:: 3. GitHubのアカウントを作成する
:: 4. GitHubにログインする
:: 5. GitHubにSSH公開鍵を登録する（https://github.com/settings/ssh）
::     * 公開鍵ファイル(filename.pub)の中身をペーストする
:: 6. 接続テストする
::    * GitBash > ssh -T github.com.filename
::    * 以下のように表示されたらOK
::        setsockopt IP_TOS 8: Invalid argument:
::        Hi ytyaru! You've successfully authenticated, but GitHub does not provide shell access.
::
:: 参考
:: http://dev.classmethod.jp/tool/github-ssh-sub-account-setting/
:: http://www.slideshare.net/nullpopopo/github-12293342
:: http://dackdive.hateblo.jp/entry/2015/10/12/210547


:: リモートリポジトリを生成する
call CallCreateRepository.bat


:: GitHubアカウント
SET USER_NAME=YourUsername
SET USER_MAIL=YourMail@domain.com
:: "C:\Documents and Settings\Administrator\.ssh\config
SET SSH_HOST=github.com.YourUsername
:: GitHubのリポジトリ名（アップロード先リポジトリ名）
:: このファイルの親ディレクトリ名
for %%I in (.) do set REPOSITORY_NAME=%%~nI%%~xI
echo %REPOSITORY_NAME%


:: ローカルリポジトリに.gitファイル一式を作成（リビジョン管理の開始）
git init

:: アカウント切替
git config --local user.name "%USER_NAME%"
git config --local user.email "%USER_MAIL%"

:: ローカルリポジトリにソースコードをステージングしコミットする
git add .
git commit -m "initial commit"

:: .git/configの設定追記コマンド。1回だけ実行すればいい。
:: 「fatal: remote origin already exists.」というエラーが表示されたらコメントアウトする。
git remote add origin git@%SSH_HOST%:%USER_NAME%/%REPOSITORY_NAME%.git

:: ローカルリポジトリからリモートリポジトリへ修正を反映させる
git push origin master

pause
