class Post < ApplicationRecord
  
  has_many :posts_tags
  has_many :tags, through: :posts_tags

  has_one :user
end
