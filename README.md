# Task-Box
 
タスク管理アプリを作成しました。
ユーザーの新規作成から新規タスクの投稿、編集が可能です。
 
## アプリケーション概要
 
タスク管理アプリです。1人でもチーム単位でもタスクの管理、共有ができます。
 
***デモ***
 
https://gyazo.com/25ed9fcf6e545f10596993c4fc561ec7

## 制作背景(意図)

タスク内容を可視化することでチームメンバーの考え方や取り組み方を共有し成長できると考えたためです。前職、前々職で務めていた際に毎日行うことや行なったことを日報として提出していました。その場合上司は部下のタスク内容を見ることができるが、部下は上司の行なっている内容を見ることができませんでした。また、可視化することで仕事内容について話す冒頭部分を省略化でき、本題部分に時間を作れると考えました。結果として部下、上司、同期全員の取り組み方を理解でき、生産性が向上すると考えました。

## 工夫したポイント

1人単位でもグループ単位でもタスク管理ができるように、それぞれでグループ作成を行えるようにしました。また、余計なものを触らないようにできる限りシンプルな見た目にすることを工夫しました。

## 機能
 
- ユーザー登録、ログイン機能
- 投稿機能
- グループ作成機能
 
## 競合作品との比較:VS.

既存チャットアプリ等があるが、タスク管理1つに絞ることで余計な情報をシャットアウトすることができる。また、複数人でタスクを共有することでそれぞれのメンバーの行う内容、考え方を理解することができます。
 
## 開発環境:Development environment
 
### Server ID

https://task-box.herokuapp.com

### テストアカウント

email: test955@gmail.com

pass ; test12344321

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

## 今後取り組みたい、取り入れたい機能

- できなかった理由、今後の改善点を作成する部分を作りたいと考えています。
- タスク1つ1つにチェックボックスを作成し、チェック数によって進捗が把握できるようにしたいと考えております。

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
