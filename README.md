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
| family-name         | string      | null: false                   |
| first-name          | string      | null: false                   |
| family-name-reading | string      | null: false                   |
| first-name-reading  | string      | null: false                   |
| birth-date          | date        | null: false                   |


# productsテーブル
| Column              | Type        | Options                       |
| ------------------- | ----------- | ----------------------------- |
| titile              | string      | null: false                   |
| content             | string      | null: false                   |
| category            | integer     | null: false                   |
| status              | integer     | null: false                   |
| charge              | integer     | null: false                   |
| shipping-days       | integer     | null: false                   |
| price               | integer     | null: false                   |
| user                | references  | null: false, foreign_key:true |


# destinationsテーブル
| Column              | Type        | Options                       |
| ------------------- | ----------- | ----------------------------- |
| postal-code         | string      | null: false                   |
| prefacture          | integer     | null: false                   |
| city                | string      | null: false                   |
| house-number        | string      | null: false                   |
| building-name       | string      |                               |
| telephone-number    | string      | null: false                   |
| user                | references  | null: false, foreign_key:true |

# cardsテーブル
| Column              | Type        | Options                       |
| ------------------- | ----------- | ----------------------------- |
| user_id             | references  | null: false, foreign_key:true |