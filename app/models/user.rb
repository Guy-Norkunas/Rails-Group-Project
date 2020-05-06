class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :images, as: :imageable

  validates :username, presence: true
  validates :status, presence: true
  validates :email, presence: true, length: {minimum: 4, maximum: 254}
  validates :status, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
