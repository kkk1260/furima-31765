# テーブル設計

## users　テーブル

| Column     | Type      | Options      |
| ---------- | --------- | ------------ |
| nickname   | text      | null: false  |
| email      | string    | unique: true |
| password   | string    | null: false  |
| first_name | text      | null: false  |
| first_kata | text      | null: false  |
| last_name  | text      | null: false  |
| last_kata  | text      | null: false  |
| birthday   | string    | null: false  |

### Association

- has_many :items
- has_many :purchase_records

# items

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| item_name        | text       | null: false       |
| item_condition   | text       | null: false       |
| item_information | text       | null: false       |
| item_price       | string     | null: false       |
| category         | text       | null: false       |
| delivery_price   | string     | null: false       |
| shipment_source  | text       | null: false       |
| days_to ship     | string     | null: false       |
| user_id          | references | foreign_key: true |


### Association

- belongs_to :user
- has_one    :purchase_record

# purchase_records

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user_id    | references | foreign_key: true |
| item_id    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many   :shipping_addresses

# shipping_addresses


| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| postal_code         | string     | null: false       |
| prefectures         | text       | null: false       |
| municipality        | text       | null: false       |
| address             | text       | null: false       |
| phone_number        | string     | null: false       |
| purchase_record_id  | references | foreign_key: true |

### Association

- belongs_to :purchase_record