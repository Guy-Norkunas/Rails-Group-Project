class Post < ApplicationRecord
  
  has_many :posts_tags
  has_many :tags, through: :posts_tags

  has_many :users_posts
  has_many :user, through: :users_posts
end
