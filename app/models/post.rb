class Post < ApplicationRecord
  has_one :user, through: :users_posts
end
