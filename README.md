# Job-Wiki
  それぞれの業界の方々がみんなで作成した職業のwikiを見ることができる学生向けのアプリです。<br>またwikiの閲覧だけでなく登録している方と実際にチャットでやりとりができます。

<a href="https://gyazo.com/5edcbe602af443e40995d9c7070675c5"><img src="https://i.gyazo.com/5edcbe602af443e40995d9c7070675c5.jpg" alt="Image from Gyazo" width="1438"/></a>

# ペルソナ
  就活を始める大学３,４年生で進路をこれから考えるために職業研究を開始する学生。<br>しかし、実際の職場環境や仕事内容がイメージできず自分が何をしたいのか考えている人。
# URL
  <https://job-wiki-11.herokuapp.com/><br>
  HOME画面の下部のゲストログインで閲覧することが可能です。

  - Ruby 2.6.5
  - Ruby on Rails 6.0.3.6
  - Javascript
  - bootstrap
  - MySQL 14.14
  - heroku

# 機能一覧
  - ユーザー登録、ログイン機能(devise)
  - 職業編集機能
  - チャット機能(Ajax)
#  テスト
  - 単体テスト
  - 機能テスト
  - 統合テスト

# テーブル設計

## users テーブル

| Column              | Type        | Options                         |
| ------------------- | ----------- | ---------------------------     |
| email               | string      | null: false, unique: true       |
| encrypted_password  | string      | null: false                     |
| name            | string      | null: false                     |
| category_id         | integer     | null: false, foreign_key: true  |


### Association

- has_many :chats
- has_many :messages
- belongs_to :category
- has_one_attached :image dependent: :destroy


## jobs テーブル

| Column        | Type          | Options                       |
| ------------  | ----------    | ----------------------------- |
| name          | string        | null: false                   |
| category_id   | integer       | null: false, foreign_key: true|
| description   | text          | null: false                   |
| active        | text          | null: false                   |
| flow          | text          | null: false                   |
| become        | text          | null: false                   |
| qualification | text          | null: false                   |
| salary        | text          | null: false                   |
| rewarding     | text          | null: false                   |
| busy          | text          | null: false                   |
| correct       | text          | null: false                   |
| aspiring      | text          | null: false                   |
| status        | text          | null: false                   |
| demand        | text          | null: false                   |
| future        | text          | null: false                   |

### Association

-  belongs_to :user

## rooms テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| id             | integer    | null: false                    |

### Association

- has_many :chats
- has_many :messages

## messages テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| message        | text       | null: false                    |
| user           | references | null: false, foreign_key: true |
| room           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## chats(中間テーブル) テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| room           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room