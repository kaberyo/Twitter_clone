# DB設計

## users table
|Column|Type|Option|
|------|----|------|
|name|string|index: true, default: "", null: false, unique: true|
|username|string|index: true, default: "", null: false, unique: true|
|email|string|null:false, unique:true|
|password|string|null:false|
|about|stirng||
|location|stirng||
|website|string||
|avator|stirng||
|cover|stirng||
|color|string||
|tweets_count|string|default: 0, null: false|
|follows_count|string|default: 0, null: false|
|followers_count|string|default: 0, null: false|
|likes_count|string||

### Association
- has_many: tweets
- has_many: favorites
- has_many: tweets, through: :favorites
- has_many: retweets
- has_many: tweets, through: :retweets
- has_many: relationships
- has_many: followed, through: :relationships

## tweets tabel
|Column|Type|Option|
|------|----|------|
|text|index: true, string|null: false, limit: 140|
|user_id|integer|null: false, foreign_key: true|
|location|string||
|media|string||
|parent_id|integer||

### Association
- belongs_to: user
- has_many: favorites
- has_many: users, through: favorites
- has_many: retweets
- has_many: users, through: retweets


## favorite table
いいね機能の中間テーブル

|Column|Type|Option|
|------|----|------|
|user_id|reference|null: false, foreign_key: true|
|tweet_id|reference|null: false, foreign_key: true|

### Association
- belongs_to: user
- belongs_to: tweet

## retweet table
リツイート機能の中間テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|tweet_id|reference|null: false, foreign_key: true|

### Association
- belongs_to: user
- belongs_to: tweet

## relationship table
フォロー機能の中間テーブル

|Column|Type|Options|
|------|----|-------|
|following_id|reference|null: false, foreign_key: true|
|followed_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :following, class_name: "User"
- belongs_to :followed, class_name: "User"
