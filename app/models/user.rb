class UserValidator < ActiveModel::Validator
  def validate(user)
    if User.find_by(username: user.username)
      user.errors[:username] << 'Username already exists'
    end
  end
end

class User < ApplicationRecord
  include ActiveModel::Validations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # associations

  has_many :posts
  has_many :images, as: :imageable

  # validations

  validates :username, presence: true
  validates :status, presence: true
  validates :email, presence: true, length: { minimum: 4, maximum: 254 }
  validates :status, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_with UserValidator
end
