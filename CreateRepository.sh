#!/bin/sh

echo "-----------------------------------------" | nkf -s
echo "GitHubにリモート･リポジトリを作成します。" | nkf -s
echo "-----------------------------------------" | nkf -s

# http://curl.haxx.se/ca/cacert.pem
CURL_PEM="C:\Program Files\Git\ssl\certs\cacert.pem"
GITHUB_USER="YourUsername"
GITHUB_PASS="YourPassword"
REPO_DESC="リポジトリの説明です。"
REPO_HOME="https://www.google.co.jp"

# このファイルの親ディレクトリ名をリポジトリ名とする
REPO_NAME=`dirname "$0"`
REPO_NAME=`basename ${REPO_NAME}`
echo "${REPO_NAME}"

# リモート･リポジトリ名
#   半角英数字と3つの記号_-.が使える

echo "curl --cacert : ${CURL_PEM}" | nkf -s
echo "GitHub Username : ${GITHUB_USER}" | nkf -s
echo "GitHub Password : ${GITHUB_PASS}" | nkf -s
echo "GitHub Repository name : ${REPO_NAME}" | nkf -s
echo "GitHub Repository description : ${REPO_DESC}" | nkf -s
echo "GitHub Repository homepage : ${REPO_HOME}" | nkf -s

echo '{"name":"'${REPO_NAME}'","description":"'${REPO_DESC}'","homepage":"'${REPO_HOME}'"}' | nkf -w | curl --cacert "${CURL_PEM}" -u "${GITHUB_USER}:${GITHUB_PASS}" https://api.github.com/user/repos -d @- | nkf -s
echo "-----------------------------------------" | nkf -s
echo "完了しました。" | nkf -s
# echo "Enterキーを入力してください。" | nkf -s
echo "-----------------------------------------" | nkf -s
# read Wait
