class Post < ApplicationRecord
  belongs_to :image
  
  has_many :posts_tags
  has_many :tags, through: :posts_tags
end
