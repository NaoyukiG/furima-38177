# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# usersテーブル
| Column              | Type        | Options                       |
| ------------------- | ----------- | ----------------------------- |
| nickname            | string      | null: false                   |
| email               | string      | null: false, unique: true     |
| encrypted_password  | string      | null: false                   |
| family_name         | string      | null: false                   |
| first_name          | string      | null: false                   |
| family_name_reading | string      | null: false                   |
| first_name_reading  | string      | null: false                   |
| birth_date          | date        | null: false                   |

## Association
- has_many :products

# productsテーブル
| Column              | Type        | Options                       |
| ------------------- | ----------- | ----------------------------- |
| title               | string      | null: false                   |
| content             | text        | null: false                   |
| category_id         | integer     | null: false                   |
| status_id           | integer     | null: false                   |
| charge_id           | integer     | null: false                   |
| shipping_source_id  | integer     | null: false                   |
| shipping_days_id    | integer     | null: false                   |
| price               | integer     | null: false                   |
| purchase_management | references  | null: false, foreign_key:true |

## Association
- belongs_to :user
- has_one :purchase_management

# destinationsテーブル
| Column              | Type        | Options                       |
| ------------------- | ----------- | ----------------------------- |
| postal_code         | string      | null: false                   |
| prefacture_id       | integer     | null: false                   |
| city                | string      | null: false                   |
| house_number        | string      | null: false                   |
| building_name       | string      |                               |
| telephone_number    | string      | null: false                   |
| purchase_management | references  | null: false, foreign_key:true |

## Association
- has_one :purchase_management

# Purchase_managementsテーブル
| Column              | Type        | Options                       |
| ------------------- | ----------- | ----------------------------- |
| product             | references  | null: false, foreign_key:true |
| destinaion          | references  | null: false, foreign_key:true |

## Association
- belongs_to :destinaion
- belongs_to :product