# テーブル設計

## users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| birthday | date    | null: false |
| sex_id   | integer | null: false |

### association
has_many :lists
has_many :follows


## lists テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| public_id | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

### association
belongs_to :user
has_many :animes


## animes テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| genre    | string     | null: false                    |
| score    | integer    | null: false                    |
| memo     | text       | null: false                    |
| list     | references | null: false, foreign_key: true |

### association
belongs_to :list


## follows

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |

### association
belongs_to :user
