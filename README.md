# README

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ |-------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| confirm_password   | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth              | date   | null: false               |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- |------------------------------- |
| item_name   | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | integer    | null: false                    |
| state       | integer    | null: false                    |
| charge      | integer    | null: false                    |
| region      | integer    | null: false                    |
| days        | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- |------------------------------- |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :residence

## residencesテーブル

| Column        | Type       | Options                        |
| -----------   | ---------- |------------------------------- |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| telephone     | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order
