@echo off
:: -------------------------------------
:: リモート･リポジトリを削除する
:: -------------------------------------

set CURL_PEM=C:\Program Files\Git\ssl\certs\cacert.pem
set GITHUB_USER="YourUsername"
set GITHUB_PASS="YourPassword"
for %%I in (.) do set REPOSITORY_NAME=%%~nI%%~xI

:: curl --cacert "C:\Program Files\Git\ssl\certs\cacert.pem" -X DELETE -u "YourUsername:YourPassword" https://api.github.com/repos/ytyaru0/CreateRepository201610012001 | nkf -s

curl --cacert "%CURL_PEM%" -X DELETE -u "%GITHUB_USER%:%GITHUB_PASS%" https://api.github.com/repos/%GITHUB_USER%/%REPOSITORY_NAME% | nkf -s

pause
@echo on
