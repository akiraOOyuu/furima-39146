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
| category           |string     |null: false                   |
| status             |string     |null: false                   |
| postage            |string     |null: false                   |
| area               |string     |null: false                   |
| deli_days          |string     |null: false                   |
| user               |references |null: false, foreign_key: true|


### Association

- belong_to :user
- has_one :pays

## pays テーブル

| Colum              | Type      | Option                       |
|--------------------|-----------|------------------------------|
| item               |references |null: false, foreign_key: true|
| user               |references |null: false, foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user

## delis テーブル

| Colum              | Type      | Option                       |
|--------------------|-----------|------------------------------|
| postcode           |string     |null: false                   |
| prefecture_id      |integer    |null: false                   |
| city               |string     |null: false                   |
| block              |string     |null: false                   |
| building           |string     |                              |
| item               |references |null: false, foreign_key: true|
| user               |references |null: false, foreign_key: true|
| pays               |references |null: false, foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user
- belong_to :pays