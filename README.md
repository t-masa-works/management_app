# README

## Users
|モデル名|カラム名         |データ型|
|-------|---------------|------|
|User   |user_name      |string|
|       |email          |string|
|       |password_digest|string|

## Tasks

|モデル名 |カラム名    |データ型  |
|-------|-----------|--------|
|Task   |title      |string  |
|       |content    |text    |
|       |status     |boolean |
|       |completion |boolean |
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
