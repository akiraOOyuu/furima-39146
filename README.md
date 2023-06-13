# furimaのER図

## users テーブル

| Colum              | Type | Option                   |
|--------------------|------|--------------------------|
| email              |string|null: false , unique: true|
| encrypted_password |string|null: false               |
| nickname           |string|null: false               |
| first_name         |string|null: false               |
| last_name          |string|null: false               |
| first_name_reading |string|null: false               |
| last_name_reading  |string|null: false               |
| birth_date         |date  |null: false               |



## Association

- has_many :items
- has_many :pays

## items テーブル

| Colum              | Type      | Option                       |
|--------------------|-----------|------------------------------|
| title              |string     |null: false                   |
| content            |text       |null: false                   |
| category_id        |integer    |null: false                   |
| status_id          |integer    |null: false                   |
| postage_id         |integer    |null: false                   |
| prefecture_id      |integer    |null: false                   |
| deli_day_id        |integer    |null: false                    |
| price              |integer    |null: false                    |
| user               |references |null: false, foreign_key: true|


### Association

- belongs_to :user
- has_one :pay

## pays テーブル

| Colum              | Type      | Option                       |
|--------------------|-----------|------------------------------|
| item               |references |null: false, foreign_key: true|
| user               |references |null: false, foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user
- has_one :deli

## delis テーブル

| Colum              | Type      | Option                       |
|--------------------|-----------|------------------------------|
| postcode           |string     |null: false                   |
| prefecture_id      |integer    |null: false                   |
| city               |string     |null: false                   |
| block              |string     |null: false                   |
| building           |string     |                              |
| phone_number       |string    |null: false                   |
| pay                |references |null: false, foreign_key: true|

### Association

- belongs_to :pay