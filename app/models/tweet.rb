class Tweet < ApplicationRecord
  #TODO: validates
  validates :message, presence: true
  validates :message, length: {maximum: 140 }
  belongs_to :user
  has_many :likes
  has_many :like_users, through: :likes, source: :user
end
