class Tag < ApplicationRecord
  Max_length = 20

  # associations

  has_many :posts_tags
  has_many :posts, through: :posts_tags

  # validations

  validates :tag, presence: true, length: { maximum: Max_length }
end
