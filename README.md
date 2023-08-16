# README

## Users
|モデル名|カラム名         |データ型|
|-------|---------------|------|
|User   |user_name      |string|
|       |email          |string|
|       |password_digest|string|

## Tasks

|モデル名 |カラム名    |データ型 |
|-------|-----------|--------|
|Task   |title      |string  |
|       |content    |text    |
|       |status     |boolean |
|       |completion |boolean |
|       |start_time |datetime|
|       |end_time   |datetime|


## Admins
|モデル名|カラム名         |データ型|
|-------|---------------|-------|
|Admin  |admin_name     |string |
|       |email          |string |
|       |password_digest|string |

## Labels

|モデル名|カラム名|データ型|
|-------|------|-------|
|label  |label_name|string|



## Heroku デプロイ手順
- herokuにアプリケーションを作成
```
$ heroku create
```
- gemの追加
```
gem 'net-smtp'
gem 'net-imap'
gem 'net-pop'
```
```
bundle install
```

