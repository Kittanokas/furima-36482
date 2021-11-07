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
- has_many :buy_records

## items テーブル

| Column          | Type           | Options                         |
|-----------------|----------------|---------------------------------|
| name            | string         | null: false                     |
| category        | category_id    | null: false                     |
| explanation     | explanation_id | null: false                     |
| genre           | genre_id       | null: false                     |
| postage         | postage_id     | null: false                     |
| delivery_fee    | delivery_fee_id| null: false                     |
| origin_place    | origin_place_id| null: false                     |
| ship_day        | ship_day_id    | null: false                     |
| price           | integer        | null: false                     |
| user            | references     | null: false, foreign_key: true  |

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

| Column       | Type          | Options                        |
|--------------|---------------|--------------------------------|
| postal_code  | string        | null: false                    |
| prefecture   | prefecture_id | null: false                    |
| city         | string        | null: false                    |
| house_num    | string        | null: false                    |
| house_name   | string        | null: false                    |
| phone        | string        | null: false                    |
| buy_record   | references    | null: false, foreign_key: true |

## Association

- belongs_to :buy_record




