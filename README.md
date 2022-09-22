usersテーブル

| column                | type      | options                      |
--------------------------------------------------------------------
| nickname              |string     |null: false                   |        
| email                 |string     |null: false, default          |
| first_name            |string     |null: false                   |
| last_name             |string     |null: false                   |
| kana_first_name       |string     |null: false                   |
| kana_last_name        |string     |null: false                   |
| password              |string     |null: false, default          |
| birthday              |string     |null: false                   |
--------------------------------------------------------------------


itemsテーブル
| column                | type      | options                       |
---------------------------------------------------------------------
| image                 |string      |null: false                   |        
| name                  |string      |null: false                   |
| explanation           |string      |null: false                   |
| category              |string      |null: false                   |
| commodity_condition   |string      |null: false                   |
| shipping_charges      |string      |null: false                   |
| region_of_origin      |string      |null: false                   |
| days_to_ship          |string      |null: false                   |
| price                 |string      |null: false                   |
| user                  |references  |null: false, foreign_key_true |
---------------------------------------------------------------------


addressesテーブル
| column                | type      | options                       |
---------------------------------------------------------------------
| post_code             |string     |null: false                    |        
| prefectures           |string     |null: false                    |
| municipality          |string     |null: false                    |
| address               |string     |null: false                    |
| building_name         |string     |null: false                    |
| phone_number          |string     |null: false                    |
| user                  |references |null: false, foreign_key_true  |
| product               |references |null: false, foreign_key_true  |
---------------------------------------------------------------------


purchasesテーブル
| column                | type      | options                       |
---------------------------------------------------------------------
| user                  |references  |null: false, foreign_key_true |        
| product               |references  |null: false  foreign_key_true |
---------------------------------------------------------------------
