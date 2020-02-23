# Engineer Profile

エンジニアとエンジニアを繋ぐ
エンジニアのためのサイト

## ユーザー検索機能
[![Image from Gyazo](https://i.gyazo.com/0342424af1ed118aa8f16f14dac2cd7b.gif)](https://gyazo.com/0342424af1ed118aa8f16f14dac2cd7b)

## フォロー機能
[![Image from Gyazo](https://i.gyazo.com/b863afe38eff215e2dc494697aef45c6.gif)](https://gyazo.com/b863afe38eff215e2dc494697aef45c6)

## markdown記法
PR,使用言語にはmarkdown記法が使用できます

[![Image from Gyazo](https://i.gyazo.com/2868bc434bfce2037aad7db18c13aecb.jpg)](https://gyazo.com/2868bc434bfce2037aad7db18c13aecb)


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
|user|references|foreign_key: true|
|follow|references|null: false|
|user_id|index|null: false, unipue: true|
|follow_id|index|null: false, unipue: true|
### Association
- belongs_to :user
- belongs_to :follow, class_name: "User"
