# README

## users table

|Column              |Type                 |Options                  |
|--------------------|---------------------|-------------------------|
| name               | string              | null: false             |
| email              | string              | unique                  |
| encrypted_password | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| furigana_fn        | string              | null: false             |
| furigana_ln        | string              | null: false             |
| birthday           | date                | null: false             |

### Association

* has_many :items
* has_many :purchase_records

## items table

|Column              |Type                 |Options                  |
|--------------------|---------------------|-------------------------|
| name               | string              | null: false             |
| explanation        | text                | null: false             |
| category_id        | integer             | null: false             |
| status_id          | integer             | null: false             |
| shipping_charge_id | integer             | null: false             |
| shipping_area_id   | integer             | null: false             |
| delivery_time_id   | integer             | null: false             |
| price              | integer             | null: false             |
| user               | references          | foreign_key: true       |

### Association

* belongs_to :user
* has_one :purchase_record

## purchase record table

|Column              |Type                 |Options                  |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| item               | references          | foreign_key: true       |

### Association

* belongs_to :user
* belongs_to :item
* has_one:street_address

## street address

|Column              |Type                 |Options                  |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| shipping_area_id   | integer             | null: false             |
| municipality       | string              | null: false             |
| address            | string              | null: false             |
| building_name      | string              |                         |
| phone_number       | string              | null: false             |
| purchase           | references          | foreign_key: true       |

### Association

* belongs_to :purchase_record