class PostsTagValidator < ActiveModel::Validator
  def validate(posttag)

    if !Post.find(posttag.post_id)
      posttag.errors[:post_id] << "Tries to link to a post that doesn't exist"
    end
    
    if PostsTag.find_by_post_id(posttag.post_id).tag_id == posttag.tag_id
      posttag.errors[:post_id] << 'This post already has this tag'
    end

    
  end
end

class PostsTag < ApplicationRecord

  #associations

  belongs_to :post
  belongs_to :tag

  #validations

  validates :post_id, presence: true
  validates :tag_id, presence: true
  validates_with PostsTagValidator
end
