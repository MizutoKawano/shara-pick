# README

# shara-pick(シェアピック)

# デプロイURL
未デプロイ (近日)

# テスト用アカウント


# 利用方法
ユーザー登録を行い商品の出品または出品されている商品のレンタルを行う。
気に入った商品にはいいねを出来る。
商品詳細からコメントを残すことが出来る。

# 目指した課題解決
新商品が出たけど機能などを試してから購入を決めたいという時。
購入するほどではないが、ある時期に使いたい物がある時。
レジャーやスポーツなど一時的に必要な物がある時。



### 洗い出した要件

# ユーザー機能
利用者の情報管理、取引のl管理
# 一覧機能
トップページの充実、新規出品商品の表示
# 出品機能
ユーザーが実際に商品を出品する
# 商品詳細
出品されている商品の詳細を確認
# レンタル機能
出品されている商品をレンタルする
# 商品のいいね機能
出品されている商品にいいねが出来る
# コメント機能
レンタル前のユーザー同士のやりとりが出来る



# 実装予定の機能
商品の返却の機能
商品やユーザーの評価機能
Ajaxでのコラム作成
マイページの実装
支払い方法の追加
取引履歴が確認出来る機能



# データベース設計
ER図URL 
https://app.lucidchart.com/documents/edit/bcfe4ef9-51da-4851-a990-e3d9b71c103a/0_0

# ローカルでの動作方法
ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-darwin19]
Rails 6.0.3.2
git version 2.24.3 (Apple Git-128



## テーブル

### usersテーブル

| Column | Type       | Options              |
| ------ | ---------- | -------------------- |
|family_name        | string  | null:false   |
|last_name          | string  | null:false   |
|nickname           | string  | null:false   |
|email              | string  | null:false   |
| passwword         | string  | null:false   |
| date              | date    | null:false   |

### Association
 - has_many :items
 - has_many :likes
 - has_many :comments
 - has_one  :payment
 - has_one  :addresses
 - has_many :rental
 - has_many :likes

### itemsテーブル

| Column | Type       | Options                   |
| ------ | ---------- | --------------------------|
| image        | string     | null:false          |
| name         | string     | null:false          |
| comment      | text       | null:false          |
| category_id  | integer    | null:false          |
| status_id    | integer    | null:false          |
| fee_id       | integer    | null:false          |
| arium_id     | integer    | null:false          |
| day_id       | integer    | null:false          |
| price        | integer    | null:false          |
| user_id      | references | null:false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments
- has_many :likes
- has_one :address
- has_one :payment
- has_one :rental


## addresses

| Column | Type       | Options         |
| ------ | ---------- | ----------------|
| arium_id | integer  | nill:false |
| city                | string  | null:false |
| house_number        | string  | null:false |
| building_name       | string  |            |
| tellnumber          | string  | null:false | 
| postnumber          | string  | null:false |
| item_id             | references | null:false, foreign_key: true|
| user_id             | references | null:false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

### payment テーブル

| Column | Type       | Options         |
| ------ | ---------- | ----------------|
|user_id | references | null:false, foreign_key: true |
|item_id | references | null:false, foreign_key: true |

### Association
 - belongs_to :user
 - belongs_to :item

### comments テーブル

| Column | Type       | Options         |
| ------ | ---------- | ----------------|
|item_id | references | null:false, foreign_key: true |
|user_id | references | null:false, foreign_key: true |
|comment | string     | null:false      |
### Association
  belongs_to :user
  belongs_to :item

### likes テーブル

| Column | Type       | Options         |
| ------ | ---------- | ----------------|
|item_id | references | null:false, foreign_key: true |
|user_id | references | null:false, foreign_key: true |

### Association
- belongs_to:item
- belongs_to:user

### rentals テーブル

| Column | Type       | Options         |
| ------ | ---------- | ----------------|
|rental_start | date  | null:false      |
|rental_end   | date  | null:false      |
|item_id | references | null:false, foreign_key: true |
|user_id | references | null:false, foreign_key: true |

### Association
- belongs_to:user
- belongs_to:item