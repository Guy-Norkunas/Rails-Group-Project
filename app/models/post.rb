class Post < ApplicationRecord
  has_one :users_posts
  belongs_to :users, through: :users_posts
end
