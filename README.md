# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_read  | string | null: false |
| first_name_read | string | null: false |
| birth_date      | date   | null: false |

### Association

- has_many :purchases
- has_many :items

## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| text     | text       | null: false                    |
| category | string     | null: false                    |
| state    | string     | null: false                    |
| burden   | string     | null: false                    |
| area     | string     | null: false                    |
| day      | string     | null: false                    |
| price    | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | integer    | null: false                    |
| deadline      | date       | null: false                    |
| security_code | integer    | null: false                    |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item