class PostTag < ApplicationRecord
  belongs_to :tags
  belongs_to :posts
end
