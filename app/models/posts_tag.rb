class PostsTag < ApplicationRecord

  #associations

  belongs_to :post
  belongs_to :tag
end
