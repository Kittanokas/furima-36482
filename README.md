# テーブル設計

## users テーブル

| Column                | Type     | Options                    |
| ----------------------|----------|----------------------------|
| nickname              | string   | null: false                |
| full_name             | string   | null: false                |
| birthday              | integer  | null: false                |
| email                 | string   | null: false, unique: true  |
| encrypted_password    | string   | null: false                |

### Association

- has_many :items
- has_many :buy_records

## items テーブル

| Column          | Type      | Options                         |
|-----------------|-----------|---------------------------------|
| name            | string    | null: false                     |
| category        | genle_id  | null: false                     |
| explanation     | text      | null: false                     |
| genre_id        | string    | numericality: { other_than: 1 } |
| postage         | integer   | null: false                     |
| delivery_fee    | string    | null: false                     |
| origin_place    | string    | null: false                     |
| shipping_day    | integer   | null: false                     |
| price           | integer   | null: false                     |
| user            | references| null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :buy_record

## buy_records テーブル

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :buyer_address

## buyer_addresses テーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| postal_code  | string     | null: false                    |
| genre_id     | string     | numericality: { other_than:1}  |
| city         | string     | null: false                    |
| house_num    | string     | null: false                    |
| phone        | string     | null: false                    |
| buy_records  | references | null: false, foreign_key: true |

## Association

- belongs_to :buy_record




