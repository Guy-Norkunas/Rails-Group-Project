class PostsTagValidator < ActiveModel::Validator
  def validate(posttag)
    unless Post.exists?(posttag.post_id)
      posttag.errors[:post_id] << "Tries to link to a post that doesn't exist"
      return false
    end

    unless Tag.exists?(posttag.tag_id)
      posttag.errors[:tag_id] << "Tries to link to a tag that doesn't exist"
      return false
    end

  end
end

class PostsTag < ApplicationRecord
  # associations

  belongs_to :post
  belongs_to :tag

  # validations

  validates :post_id, presence: true
  validates :tag_id, presence: true
  validates_with PostsTagValidator
end
