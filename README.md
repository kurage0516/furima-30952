# テーブル設計

## users テーブル

| Column   | Type     | Options     |
| -------- | -------- | ----------- |
| nickname | string   | null: false |
| email    | string   | null: false |
| password | string   | null: false |
| name     | string   | null: false |
| birthday | datetime | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| product_name  | string     | null: false |
| text          | text       | null: false |
| category      | string     | null: false |
| product_state | string     | null: false |
| delivery_fee  | string     | null: false |
| area          | string     | null: false |
| day           | string     | null: false |
| price         | integer    | null: false |
| user          | references |             |

### Association

- belongs_to :user
- has_one    :purchase

## purchases テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| card_number     | integer    | null: false |
| expiration_date | integer    | null: false |
| security_code   | integer    | null: false |
| postal_code     | integer    | null: false |
| prefectures     | string     | null: false |
| municipality    | string     | null: false |
| address         | string     | null: false |
| building_name   | string     |             |
| phone_number    | integer    | null: false |
| user            | references |             |
### Association

- belongs_to :item
- belongs_to :user