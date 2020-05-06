class Image < ApplicationRecord
  # associations

  belongs_to :imageable, polymorphic: true

  # validations

  validates :url, presence: true, length: { minimum: 3, maximum: 254 }
end
