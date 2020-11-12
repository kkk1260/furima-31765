# テーブル設計

## users　テーブル

| Column     | Type      | Options      |
| ---------- | --------- | ------------ |
| nickname   | string    | null: false  |
| email      | string    | unique: true |
| password   | string    | null: false  |
| first_name | string    | null: false  |
| first_kata | string    | null: false  |
| last_name  | string    | null: false  |
| last_kata  | string    | null: false  |
| birthday   | string    | null: false  |

### Association

- has_many :items
- has_many :purchase_records

# items

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| condition_id     | integer    | null: false       |
| information      | text       | null: false       |
| price            | string     | null: false       |
| category_id      | integer    | null: false       |
| delivery_price   | string     | null: false       |
| shipment_source  | string     | null: false       |
| days_to ship     | string     | null: false       |
| user             | references | foreign_key: true |


### Association

- belongs_to :user
- has_one    :purchase_record

# purchase_records

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many   :shipping_addresses

# shipping_addresses


| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| postal_code_id      | integer    | null: false       |
| prefectures_id      | integer    | null: false       |
| municipality        | string     | null: false       |
| address             | string     | null: false       |
| phone_number        | string     | null: false       |
| purchase_record     | references | foreign_key: true |

### Association

- belongs_to :purchase_record