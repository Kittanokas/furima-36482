# テーブル設計

## users テーブル

| Column                | Type     | Options                    |
| ----------------------|----------|----------------------------|
| nickname              | string   | null: false                |
| kanji_last_name       | string   | null: false                |
| kanji_first_name      | string   | null: false                |
| kana_last_name        | string   | null: false                |
| kana_first_name       | string   | null: false                |
| birthday              | date     | null: false                |
| email                 | string   | null: false, unique: true  |
| encrypted_password    | string   | null: false                |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type           | Options                         |
|-----------------|----------------|---------------------------------|
| name            | string         | null: false                     |
| explanation     | text           | null: false                     |
| category_id     | integer        | null: false                     |
| status_id       | integer        | null: false                     |
| delivery_fee_id | integer        | null: false                     |
| prefecture_id   | integer        | null: false                     |
| ship_day_id     | integer        | null: false                     |
| price           | integer        | null: false                     |
| user            | references     | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :buyer_address

## buyer_addresses テーブル

| Column       | Type          | Options                        |
|--------------|---------------|--------------------------------|
| postal_code  | string        | null: false                    |
| prefecture_id| integer       | null: false                    |
| city         | string        | null: false                    |
| house_num    | string        | null: false                    |
| building_name| string        |                                |
| phone        | string        | null: false                    |
| buy_record   | references    | null: false, foreign_key: true |

## Association

- belongs_to :order




