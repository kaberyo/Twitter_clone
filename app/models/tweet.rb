class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  has_many :retweets
  has_many :users, through: :retweets
  has_and_belongs_to_many :hashtags

  mount_uploader :media, MediaUploader

  validates :text, presence: true, length: { maximum: 140 } ,unless: :media?

  def fav? (fav_user_id, fav_tweet_id)
    favorites.where(user_id: fav_user_id, tweet_id: fav_tweet_id).exists?
  end

  after_create do #DBへのコミット直前に実行される
    tweet = Tweet.find_by(id: self.id)
    hashtags  = self.text.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    #scanは正規表現とマッチするものを配列として渡す
    hashtags.uniq.map do |hashtag|
    #uniq配列の重複したオブジェクト削除
    #ハッシュタグは先頭の'#'を外した上で保存
    #find_or_create_by検索条件を指定して初めの1件を取得し、1件もなければ作成
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      tweet.hashtags << tag
    end
  end

  before_update do
    tweet = Tweet.find_by(id: self.id)
    tweet.hashtags.clear #配列の中身を削除
    hashtags = self.text.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      micropost.hashtags << tag
    end
  end

end
