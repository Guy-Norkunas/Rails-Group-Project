class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :images, as: :imageable

  validates :username, presence: true
  validates :status, presence: true
  validates :email, presence: true, legnth: {minimum: 3, maximum: 254}
end
