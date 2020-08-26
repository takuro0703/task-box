# Task-Box
 
タスク管理アプリを作成しました。
ユーザーの新規作成から新規タスクの投稿、編集が可能です。
 
## アプリケーション概要
 
タスク管理アプリです。1人でもチーム単位でもタスクの管理、共有ができます。
 
***デモ***
 
https://gyazo.com/25ed9fcf6e545f10596993c4fc561ec7
 
## 機能
 
- ユーザー登録、ログイン機能
- 投稿機能
- グループ作成機能
 
## 競合作品との比較:VS.

既存チャットアプリ等があるが、タスク管理1つに絞ることで余計な情報をシャットアウトすることができる。また、複数人でタスクを共有することでそれぞれのメンバーの行う内容、考え方を理解することができます。
 
## 開発環境:Development environment
 
### Server ID

https://task-box.herokuapp.com

### Development environment

Ruby 2.6.5

Ruby on rails 6.0.3.2

html2haml 2.2.0

sass-rails 5.1.0

mysql2
 
## 使い方
 
1. ログイン画面で新規ユーザーを作成
2. ログイン完了後、グループ作成を行う。(一人でタスク管理をするならメンバーは1人)
3. グループ作成後、左のグループをクリック
4. 画面右下の新規投稿ボタンをクリックし、リストを作成
 
## デプロイ
 
1. herokuを用いたデプロイ
2. ローカルのmasterブランチをリモートリポジトリherokuへpushする
3. $ git push heroku master
 
# Task-Box DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|name|string|null: false|
### Association
- has_many :tasks
- has_many :group_users
- has_many :groups,  through:  :group_users

## tasksテーブル
|Column|Type|Options|
|------|----|-------|
|todo|text|null: false|
|reason|text|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name||string||null: false, unique: true|
### Association
- has_many :group_users
- has_many :users,  through:  :group_users
- has_many :tasks

## group_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|
### Association
- belong_to :user
- belong_to :group
