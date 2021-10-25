class User < ApplicationRecord
  #TODO: validates
  validates :uid, presence: true #ユーザー名が空ではないこと
  validates :uid, uniqueness: true #ユーザー名が重複しないこと
  validates :pass, presence: true #パスワードが空でないこと

  has_many :tweets
  has_many :likes
  has_many :like_tweets, through: :likes, source: :tweet
end
