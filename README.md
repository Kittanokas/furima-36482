# テーブル設計

## users テーブル

| Column                | Type     | Options      |
| ----------------------|----------|--------------|
| nickname              | string   | null: false  |
| email                 | string   | null: false  |
| encrypted_password    | string   | null: false  |

### Association

- has_many :items
- has_many :buy-records

## items テーブル

| Column          | Type    | Options     |
|-----------------|---------|-------------|
| name            | string  | null: false |
| category        | string  | null: false |
| explanation     | text    | null: false |
| status          | string  | null: false |
| postage         | integer | null: false |
| origin          | string  | null: false |
| price           | integer | null: false |


### Association

- belongs_to :users
- has_one :buy-record

## buy-records テーブル

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| user     | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :buyer-address

## buyer-addresses テーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| postal-code  | integer    | null: false                    |
| state        | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| phone        | integer    | null: false                    |
## Association

- belongs_to :buy-records




