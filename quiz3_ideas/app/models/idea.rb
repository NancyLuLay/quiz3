class Idea < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  # has_many :users, through: :likes

  has_many :joins, dependent: :destroy
  # has_many :members, through: :joins, source: :join

  has_many :comments, dependent: :destroy

  def like_for(user)
    likes.find_by_user_id user
  end

  def join_for(user)
    joins.find_by_user_id user
  end

end
