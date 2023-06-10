# furimaのER図

## user テーブル

| Colum              | Type | Option     |
|--------------------|------|------------|
| email              |string|null: false |
| encrypted_password |string|null: false |
| nickname           |text  |null: false |
| first name         |text  |null: false |
| last name          |text  |null: false |
| second first name  |text  |null: false |
| second last  name  |text  |null: false |
| date of birth      |string|null: false |



## Association

- has_many :items
- belong_to :pays

## items テーブル

| Colum              | Type      | Option                       |
|--------------------|-----------|------------------------------|
| title              |text       |null: false                   |
| text               |text       |null: false                   |
| price              |string     |null: false                   |
| user               |references |null: false, foreign_key: true|


### Association

- belong_to :user
- belong_to :pays

## pays テーブル

| Colum              | Type      | Option                       |
|--------------------|-----------|------------------------------|
| delivery           |references |null: false                   |
| item               |references |null: false                   |
| user               |references |null: false, foreign_key: true|

- belongs_to :item
- belongs_to :user

## delivery テーブル

| Colum              | Type      | Option                       |
|--------------------|-----------|------------------------------|
| address            |text       |null: false                   |
| item               |references |null: false                   |
| user               |references |null: false, foreign_key: true|

- belongs_to :item
- belongs_to :user