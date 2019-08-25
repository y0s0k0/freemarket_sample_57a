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
|ZIP|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|integer|null: false|
|building|string||
|image|string||
|introduction|string||


### Association
- has_one :current_address
- has_one :delivery_information
- has_many :contacts
- has_one :money
- has_one :point
- has_many :deposit_histories
- has_many :buyer_ratings
- has_many :seller_ratings
- has_one :credit_card
- has_many :mercari_box_questions
- has_many :mercari_box_messages
- has_many :mercari_box_sukkiris
- has_many :likes
- has_many :messages



## current_addressテーブル

|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name(kana)|string|null: false|
|first_name(kana)|string|null: false|
|ZIP|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|adress|integer|null: false|
|building|string||
|phone_number|integer||
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user


## delivery_informationテーブル

|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
- [x] |first_name_kana|string|null: false|
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

## moneyテーブル

|Column|Type|Options|
|------|----|-------|
|money|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## pointテーブル

|Column|Type|Options|
|------|----|-------|
|point|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## deposit_historiesテーブル

|Column|Type|Options|
|------|----|-------|
|money|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## buyer_ratingテーブル

|Column|Type|Options|
|------|----|-------|
|condition|integer|null: false|
|message|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## seller_ratingテーブル

|Column|Type|Options|
|------|----|-------|
|condition|integer|null: false|
|message|string|null: false|
|user_id|integer|null: false, foreign_key: true|

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

## mercari_box_questionsテーブル

|Column|Type|Options|
|------|----|-------|
|contents|string|null: false|
|category|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :mercari_box_messages

## mercari_box_messagesテーブル

|Column|Type|Options|
|------|----|-------|
|message|string|null: false|
|question_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :mercari_box_qestions
- belongs_to :user
- has_many :mercari_box_sukkiris

## mercari_box_sukkirisテーブル

|Column|Type|Options|
|------|----|-------|
|message|string|null: false|
|message_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :mercari_box_messages
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
|title|string|null: false|
|image|string|null: false, foreign_key: true|
|description|string|null: false|
|category|integer|null: false|
|size|integer||
|brand|integer||
|condition|integer|null: false|
|postage|integer|null: false|
|region|integer|null: false|
|days|integer|null: false|
|price|integer|null: false|
|transaction_condition|integer|null: false|
|user_id|integer|null: false, foreign_key: true|




### Association
- belongs_to :user
- has_many :likes
- has_many :messages
- has_one :category
- has_one :brand

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