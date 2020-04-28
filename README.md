# Engineer Profile
http://18.178.126.210/

### エンジニアとエンジニアを繋ぐ
### エンジニアのためのサイト

### ログインページにguest accountボタンを設置しています
### guest accountボタンよりログインして機能確認お願いします！

## ○ログインページ ゲストアカウントでログインボタン
[![Image from Gyazo](https://i.gyazo.com/e6b52e003d26203e4ee0bcdec2782824.jpg)](https://gyazo.com/e6b52e003d26203e4ee0bcdec2782824)

## ○ユーザー検索機能
jqueyを使用して検索結果を表示させています
検索ワードを入力したと同時に検索結果が表示されます
[![Image from Gyazo](https://i.gyazo.com/e98c638ae907280ea4c3ebb7e57278a6.gif)](https://gyazo.com/e98c638ae907280ea4c3ebb7e57278a6)

## ○フォロー機能
jqueryを使用しています
[![Image from Gyazo](https://i.gyazo.com/257bf066f173022fa0be42d88f453746.gif)](https://gyazo.com/257bf066f173022fa0be42d88f453746)

## ○markdown記法
PR,使用言語にはmarkdown記法が使用できます
[![Image from Gyazo](https://i.gyazo.com/2868bc434bfce2037aad7db18c13aecb.jpg)](https://gyazo.com/2868bc434bfce2037aad7db18c13aecb)

## ○ポートフォリオ、作品投稿機能
[![Image from Gyazo](https://i.gyazo.com/8b6e94601fcdedf98b980d2dfc0ba8a1.jpg)](https://gyazo.com/8b6e94601fcdedf98b980d2dfc0ba8a1)

## ○ポートフォリオ、作品編集機能
jqueryを使用して編集画面で保存画像のプレビューを表示
新規投稿画面では選択した画像をプレビュー表示させる
[![Image from Gyazo](https://i.gyazo.com/fba6117b7ecd283643d797463bfdd991.gif)](https://gyazo.com/fba6117b7ecd283643d797463bfdd991)

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
