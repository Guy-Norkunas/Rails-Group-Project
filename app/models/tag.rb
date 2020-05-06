class Tag < ApplicationRecord
    Max_length = 20

    validates :tag, presence: true, length: {maximum: Max_length}

    has_many :posts_tags
    has_many :posts, through: :posts_tags
end
