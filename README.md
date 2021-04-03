# テーブル設計

## users テーブル

| Column              | Type        | Options                     |
| ------------------- | ----------- | --------------------------- |
| email               | string      | null: false, unique: true   |
| encrypted_password  | string      | null: false                 |
| nickname            | string      | null: false                 |
| genre_id            | integer     | null: false                 |


### Association

- has_many :chats
- has_many :messages
- has_many :jobs
- has_one_attached :image dependent: :destroy
- belongs_to_active_hash :genre


## jobs テーブル

| Column        | Type          | Options                       |
| ------------  | ----------    | ----------------------------- |
| name          | string        | null: false                   |
| genre_id      | integer       | null: false                   |
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
-  belongs_to_active_hash :genre

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