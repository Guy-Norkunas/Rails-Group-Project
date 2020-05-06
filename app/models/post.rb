class PostValidator < ActiveModel::Validator
  def validate(post)
    if !((post.images.length > 0) || (post.content))
      post.errors[:content] << 'Needs either content or an image to be a valid post'
    end
  end
end

class Post < ApplicationRecord

  #associations

  has_many :posts_tags
  has_many :tags, through: :posts_tags

  belongs_to :user

  has_many :images, as: :imageable

  #validations

  validates_with PostValidator
  
end
