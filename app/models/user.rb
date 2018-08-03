class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets
  has_many :favorites
  has_many :tweets, through: :favorites
  has_many :retweets
  has_many :tweets, through: :retweets
  has_many :relationships
  has_many :followed, through: :relationships

  mount_uploader :cover , MediaUploader
  mount_uploader :avator , MediaUploader


end
