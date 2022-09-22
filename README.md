usersテーブル

| column                | type      | options                      |
--------------------------------------------------------------------
| nickname              |string     |null: false                   |
| email                 |string     |null: false, unique: true     |
| first_name            |string     |null: false                   |
| last_name             |string     |null: false                   |
| kana_first_name       |string     |null: false                   |
| kana_last_name        |string     |null: false                   |
| encrypted_password    |string     |null: false                   |
| birthday              |date       |null: false                   |
--------------------------------------------------------------------

association

has_many :items
has_many :purchases

itemsテーブル
| column                | type      | options                       |
---------------------------------------------------------------------
| name                  |string      |null: false                   |
| explanation           |text        |null: false                   |
| category_id           |integer     |null: false                   |
| commodity_condition_id|integer     |null: false                   |
| shipping_charges_id   |integer     |null: false                   |
| prefecture_id         |integer     |null: false                   |
| days_to_ship_id       |integer     |null: false                   |
| price                 |integer     |null: false                   |
| user                  |references  |null: false, foreign_key_true |
---------------------------------------------------------------------


association

belongs_to :user
has_one :purchase




addressesテーブル
| column                | type      | options                       |
---------------------------------------------------------------------
| post_code             |string     |null: false                    |
| prefecture_id         |integer    |null: false                    |
| municipality          |string     |null: false                    |
| address               |string     |null: false                    |
| building_name         |string     |                               |
| phone_number          |string     |null: false                    | 
| purchase              |references |null: false, foreign_key_true  |
---------------------------------------------------------------------

belongs_to :item
belongs_to :user
has_one :address


purchasesテーブル
| column                | type      | options                       |
---------------------------------------------------------------------
| user                  |references  |null: false, foreign_key_true |        
| product               |references  |null: false, foreign_key_true |
---------------------------------------------------------------------

association

has_one :address
belongs_to :item
