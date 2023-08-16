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
```
git add .
git commit -m""
```

- Heroku buildpack追加
```
$ heroku buildpacks:set heroku/ruby
$ heroku buildpacks:add --index 1 heroku/nodejs
```
- PostgreSQLアドオン追加
```
$ heroku addons:create heroku-postgresql
```
- デプロイ
```
git push heroku step2:master
```
## エラー発生
- エラー対処  
Heroku stackバージョンエラー  
バージョン切り替え　22→20
```
$ heroku stack:set heroku-20
```
- Platform不足エラー  
Platform追加
```
bundle lock --add-platform x86_64-linux
```
- node.jsエラー  
package.jsonに追記
```
,
  "engines": {
    "node": "16.x"
  }
```
コミット

- 再デプロイ
```
git push heroku step2:master
```
Heroku上データベース作成
```
heroku run rails db:migrate
```

## 使用gemバージョン
```
bbrev (default: 0.1.0)
actioncable (6.1.7.4, 6.1.7.2, 6.1.6, 6.0.3)
actionmailbox (6.1.7.4, 6.1.7.2, 6.1.6, 6.0.3)
actionmailer (6.1.7.4, 6.1.7.2, 6.1.6, 6.0.3)
actionpack (6.1.7.4, 6.1.7.2, 6.1.6, 6.0.3)
actiontext (6.1.7.4, 6.1.7.2, 6.1.6, 6.0.3)
actionview (6.1.7.4, 6.1.7.2, 6.1.6, 6.0.3)
activejob (6.1.7.4, 6.1.7.2, 6.1.6, 6.0.3)
activemodel (6.1.7.4, 6.1.7.2, 6.1.6, 6.0.3)
activerecord (6.1.7.4, 6.1.7.2, 6.1.6, 6.0.3)
activestorage (6.1.7.4, 6.1.7.2, 6.1.6, 6.0.3)
activesupport (6.1.7.4, 6.1.7.2, 6.1.6, 6.0.3)
addressable (2.8.5, 2.8.4, 2.8.1, 2.8.0)
autoprefixer-rails (10.4.13.0)
base64 (default: 0.1.0)
bcrypt (3.1.19)
benchmark (default: 0.1.1)
better_errors (2.10.1)
bigdecimal (default: 3.0.0)
bindex (0.8.1)
binding_of_caller (1.0.0)
bootsnap (1.16.0, 1.8.1)
bootstrap (4.4.1)
builder (3.2.4)
bundler (2.4.18, 2.4.13, default: 2.2.15)
byebug (11.1.3)
capybara (3.39.2, 3.38.0, 3.35.3)
carrierwave (3.0.2, 3.0.1)
cgi (default: 0.2.0)
childprocess (3.0.0)
coderay (1.1.3)
concurrent-ruby (1.2.2, 1.2.0, 1.1.9)
crass (1.0.6)
csv (default: 3.1.9)
date (3.3.3, default: 3.1.0)
dbm (default: 1.1.0)
debug (default: 0.1.0)
debug_inspector (1.1.0)
delegate (default: 0.2.0)
did_you_mean (default: 1.5.0)
diff-lcs (1.5.0)
digest (default: 3.0.0)
dotenv (2.8.1)
dotenv-rails (2.8.1)
drb (default: 2.0.4)
english (default: 0.7.1)
erb (default: 2.2.0)
erubi (1.12.0, 1.10.0)
etc (default: 1.2.0)
execjs (2.8.1)
factory_bot (6.2.1)
factory_bot_rails (6.2.0)
faker (3.2.1, 3.2.0)
fcntl (default: 1.0.0)
ffi (1.15.5, 1.15.3)
fiddle (default: 1.0.6)
fileutils (default: 1.5.0)
find (default: 0.1.0)
forwardable (default: 1.3.2)
getoptlong (default: 0.1.1)
globalid (1.1.0, 0.5.2)
i18n (1.14.1, 1.12.0, 1.8.10)
image_processing (1.12.2)
io-console (default: 0.5.7)
io-nonblock (default: 0.1.0)
io-wait (default: 0.1.0)
ipaddr (default: 1.2.2)
irb (default: 1.3.5)
jbuilder (2.11.5, 2.11.2)
jquery-rails (4.6.0)
json (default: 2.5.1)
launchy (2.5.2)
letter_opener (1.8.1)
letter_opener_web (2.0.0)
listen (3.8.0, 3.7.0)
logger (default: 1.4.3)
loofah (2.21.3, 2.19.1, 2.12.0)
mail (2.8.1, 2.7.1)
marcel (1.0.2, 0.3.3)
matrix (0.4.2, default: 0.3.1)
method_source (1.0.0)
mimemagic (0.3.10)
mini_magick (4.12.0)
mini_mime (1.1.5, 1.1.2, 1.1.1)
minitest (5.19.0, 5.18.1, 5.17.0, 5.14.4, 5.14.2)
msgpack (1.7.2, 1.7.1, 1.6.0, 1.4.2)
mutex_m (default: 0.1.1)
net-ftp (default: 0.1.1)
net-http (default: 0.1.1)
net-imap (0.3.7, 0.3.6, 0.3.4, default: 0.1.1)
net-pop (0.1.2, default: 0.1.1)
net-protocol (0.2.1, default: 0.1.0)
net-smtp (0.3.3, default: 0.2.1)
nio4r (2.5.9, 2.5.8)
nkf (default: 0.1.0)
nokogiri (1.15.4 arm64-darwin, 1.15.3 arm64-darwin, 1.15.2 arm64-darwin, 1.14.2 arm64-darwin, 1.12.4 arm64-darwin)
observer (default: 0.1.1)
open-uri (default: 0.1.0)
open3 (default: 0.1.1)
openssl (default: 2.2.0)
optparse (default: 0.1.0)
ostruct (default: 0.3.1)
pathname (default: 0.1.0)
pg (1.5.3, 1.4.5)
popper_js (1.16.1)
power_assert (1.2.0)
pp (default: 0.1.0)
prettyprint (default: 0.1.0)
prime (default: 0.1.2)
pry (0.14.2)
pry-byebug (3.10.1)
pry-rails (0.3.9)
pstore (default: 0.1.1)
psych (default: 3.3.0)
public_suffix (5.0.3, 5.0.1, 4.0.6)
puma (5.6.6, 5.6.5, 4.3.8)
racc (1.7.1, 1.6.2, 1.5.2, default: 1.5.1)
rack (2.2.8, 2.2.7, 2.2.6.2, 2.2.3)
rack-mini-profiler (2.3.4)
rack-proxy (0.7.6)
rack-test (2.1.0, 2.0.2, 1.1.0)
rails (6.1.7.4, 6.1.7.2, 6.1.6, 6.0.3)
rails-dom-testing (2.2.0, 2.1.1, 2.0.3)
rails-html-sanitizer (1.6.0, 1.5.0, 1.4.2)
railties (6.1.7.4, 6.1.7.2, 6.1.6, 6.0.3)
rake (13.0.6, 13.0.3)
rb-fsevent (0.11.2, 0.11.0)
rb-inotify (0.10.1)
rbs (1.0.4)
rdoc (default: 6.3.0)
readline (default: 0.0.2)
readline-ext (default: 0.1.1)
regexp_parser (2.8.1, 2.7.0, 2.1.1)
reline (default: 0.2.5)
resolv (default: 0.2.0)
resolv-replace (default: 0.1.0)
rexml (3.2.6, 3.2.5)
rinda (default: 0.1.0)
rouge (4.1.2)
rspec-core (3.12.2)
rspec-expectations (3.12.3)
rspec-mocks (3.12.6)
rspec-rails (6.0.3)
rspec-support (3.12.1)
rss (0.2.9)
ruby-vips (2.1.4)
rubyzip (2.3.2)
sass-rails (6.0.0)
sassc (2.4.0)
sassc-rails (2.1.2)
securerandom (default: 0.1.0)
selenium-webdriver (4.10.0)
semantic_range (3.0.0)
set (default: 1.0.1)
shellwords (default: 0.1.0)
singleton (default: 0.1.1)
spring (4.1.1, 2.1.1)
spring-commands-rspec (1.0.4)
spring-watcher-listen (2.0.1)
sprockets (4.2.0, 4.0.2)
sprockets-rails (3.4.2, 3.2.2)
sqlite3 (1.4.2)
ssrf_filter (1.1.1)
stringio (default: 3.0.0)
strscan (default: 3.0.0)
syslog (default: 0.1.0)
tempfile (default: 0.1.1)
test-unit (3.3.7)
thor (1.2.2, 1.2.1, 1.1.0)
thread_safe (0.3.6)
tilt (2.2.0, 2.1.0, 2.0.10)
time (default: 0.1.0)
timeout (0.4.0, 0.3.2, default: 0.1.1)
tmpdir (default: 0.1.2)
tracer (default: 0.1.1)
tsort (default: 0.1.0)
turbolinks (5.2.1)
turbolinks-source (5.2.0)
typeprof (0.12.0)
tzinfo (2.0.6, 1.2.9)
un (default: 0.1.0)
uri (default: 0.10.1)
weakref (default: 0.1.1)
web-console (4.2.0, 4.1.0)
webdrivers (5.3.1, 5.2.0, 4.6.1)
webpacker (5.4.4)
websocket (1.2.9)
websocket-driver (0.7.6, 0.7.5)
websocket-extensions (0.1.5)
xpath (3.2.0)
yaml (default: 0.1.1)
zeitwerk (2.6.11, 2.6.10, 2.6.9, 2.6.8, 2.6.7, 2.4.2)
zlib (default: 1.1.0)
```