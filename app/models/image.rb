class ImageValidator < ActiveModel::Validator
  def validate(image)
    if Image.exists?(url: image.url)
      image.errors[:url] << 'This image url is already in use'
    end
  end
end

class Image < ApplicationRecord
  # associations

  belongs_to :imageable, polymorphic: true

  # validations

  validates :url, presence: true, length: { minimum: 3, maximum: 254 }
  validates_with ImageValidator
end
