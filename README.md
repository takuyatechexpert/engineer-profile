# Enginner Profile DB設計

## users テーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false, null:false, unique: true|
|jobs|string|null: false|
|sns|string|null: false|
|pr|text|null: false|
|image|string|null: false|
### Association
- has_many :follows
- has_many :followings, through: :follows, source: :follow
- has_many :reverse_of_follows, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_follows, source: :user

## follows テーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|follow|references|null: false|
|user_id|index|null: false, unipue: true|
|follow_id|index|null: false, unipue: true|
### Association
- belongs_to :user
- belongs_to :follow, class_name: "User"
