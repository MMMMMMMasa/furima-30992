# README

## users table

|Column              |Type                 |Options                  |
|--------------------|---------------------|-------------------------|
| name               | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| first name         | string              | null: false             |
| last name          | string              | null: false             |
| furigana fn        | string              | null: false             |
| furigana ln        | string              | null: false             |
| birthday           | integer             | null: false             |

### Association

* has_many :items
* has_many :purchase record

## items table

|Column              |Type                 |Options                  |
|--------------------|---------------------|-------------------------|
| name               | string              | null: false             |
| explanation        | text                | null: false             |
| category           | integer             | null: false             |
| status             | integer             | null: false             |
| shipping charges   | integer             | null: false             |
| shipping area      | integer             | null: false             |
| delivery time      | integer             | null: false             |
| price              | integer             | null: false             |
| user               | references          | foreign_key: true       |

### Association

* belongs_to :user
* has_one :purchase record

## purchase record table

|Column              |Type                 |Options                  |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| item               | references          | foreign_key: true       |

### Association

* belongs_to :user
* belongs_to :item
* has_one:street address

## street address

|Column              |Type                 |Options                  |
|--------------------|---------------------|-------------------------|
| postal code        | string              | null: false             |
| prefectures        | integer             | null: false             |
| municipality       | string              | null: false             |
| address            | string              | null: false             |
| building name      | string              | null: true              |
| phone number       | string              | null: false             |
| purchase           | references          | foreign_key: true       |

### Association

* belongs_to :purchase record