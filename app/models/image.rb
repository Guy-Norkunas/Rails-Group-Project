class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  validates :url, presence: true, length: {minimum: 3, maximum: 254}
end
