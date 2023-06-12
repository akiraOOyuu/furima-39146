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
| last _name_reading |string|null: false               |
| birth_date         |date  |null: false               |



## Association

- has_many :items
- has_one :items_user

## items テーブル

| Colum              | Type      | Option                       |
|--------------------|-----------|------------------------------|
| title              |text       |null: false                   |
| text               |text       |null: false                   |
| price              |string     |null: false                   |
| user_id            |references |null: false, foreign_key: true|


### Association

- belong_to :user
- has_one :items_user

## items_users テーブル

| Colum              | Type      | Option                       |
|--------------------|-----------|------------------------------|
| item_id            |references |null: false, foreign_key: true|
| user_id            |references |null: false, foreign_key: true|

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
| building           |string     |null: false                   |
| item               |references |null: false, foreign_key: true|
| user               |references |null: false, foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user
- belong_to :items_users