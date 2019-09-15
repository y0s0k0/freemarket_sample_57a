# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|phone_number|integer|null: false|
|zip|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|integer|null: false|
|building|string|
|image|string|
|introduction|string|

### Association
- has_one :delivery_information
- has_many :contacts
- has_one :money
- has_one :point
- has_many :deposit_histories
- has_many :ratings
- has_one :credit_card
- has_many :mercari_box_questions
- has_many :mercari_box_messages
- has_many :mercari_box_sukkiris
- has_many :likes
- has_many :messages


## delivery_informationテーブル

|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|phone_number|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## contactsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|contact_message|string|null: false|
|category_id|integer|null: false|
|item_id|integer|null: false|
|buyer_seller|string|null: false|
|accident_year|integer|null: false|
|accident_month|integer|null: false|
|accident_day|integer|null: false|
|accident_hour|integer|null: false|
|accident_minute|integer|null: false|
|mercari_id|integer|null: false|
|detail|integer|null: false|
|relate_items|integer|null: false|
|exit_reason|integer|null: false|

### Association
- belongs_to :user


## ratingテーブル

|Column|Type|Options|
|------|----|-------|
|condition|integer|null: false|
|message|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|seller_or_buyer|integer|null: false|

### Association
- belongs_to :user


## credit_cardテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|month|integer|null: false|
|year|integer|null: false|
|securitycode|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## bankテーブル

|Column|Type|Options|
|------|----|-------|
|bank_name|string|null: false|
|kind|integer|null: false|
|code|integer|null: false|
|number|integer|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false, foreign_key: true|
|description|string|null: false|
|size|integer||
|brand|integer||
|condition|integer|null: false|
|postage|integer|null: false|
|region|integer|null: false|
|delivery_schedule|integer|null: false|
|price|integer|null: false|
|transaction_condition|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :likes
- has_many :messages
- has_many :images
- has_one :brand
- has_many :categories


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|integer|null: false|
|item|references|null: false,foreign_key: true|

### Association
- belongs_to :item


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|file_name|string|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## likeテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## messageテーブル

|Column|Type|Options|
|------|----|-------|
|message|string|null: false|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item


## brandテーブル

|Column|Type|Options|
|------|----|-------|
|brand_name|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item