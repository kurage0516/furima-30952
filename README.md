# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| surname            | string   | null: false |
| name               | string   | null: false |
| surname_ruby       | string   | null: false |
| name_ruby          | string   | null: false |
| birthday           | date     | null: false |

### Association

- has_many :items
- has_many :purchase_histories

## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| product_name     | string     | null: false       |
| text             | text       | null: false       |
| category_id      | integer    | null: false       |
| product_state_id | integer    | null: false       |
| delivery_fee_id  | integer    | null: false       |
| area_id          | integer    | null: false       |
| day_id           | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_history

## purchase_domiciles テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| postal_code     | string     | null: false       |
| area_id         | integer    | null: false       |
| municipality    | string     | null: false       |
| address         | string     | null: false       |
| building_name   | string     |                   |
| phone_number    | string     | null: false       |
| user            | references | foreign_key: true |
### Association

- has_one :purchase_histories

## purchase_histories テーブル
| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user_id   | integer    | foreign_key: true |
| item_id   | integer    | foreign_key: true |

- belongs_to :item
- belongs_to :user
- belongs_to :purchase_domiciles
