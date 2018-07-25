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
- has_many: favorites
- has_many: retweets
- has_many: tweets
- has_many: relationships

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
- has_many: favorites, through: users
- has_many: retweets, through: users

## favorite Table
|Column|Type|Option|
|------|----|------|
|user_id|reference|null: false, foreign_key: true|
|tweet_id|reference|null: false, foreign_key: true|

### Association
- belongs_to: user
- belongs_to: tweet

## retweet table
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|tweet_id|reference|null: false, foreign_key: true|

### Association
- belongs_to: user
- belongs_to: tweet

## relationship tables
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|follow_id|reference|null: false, foreign_key: true|

### Association
- belongs_to: user
