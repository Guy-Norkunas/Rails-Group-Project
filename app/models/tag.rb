class Tag < ApplicationRecord

  # associations

  has_many :posts_tags
  has_many :posts, through: :posts_tags

  # validations

  validates :tag, presence: true, length: { maximum: 20 }
end
