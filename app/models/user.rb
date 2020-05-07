class UserValidator < ActiveModel::Validator
  def validate(user)
    if User.find_by(username: user.username)
      user.errors[:username] << 'Username already exists'
    end
  end
end

class User < ApplicationRecord
  include ActiveModel::Validations  
  attr_writer :login


  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  # associations

  has_many :posts
  has_many :images, as: :imageable
  has_many :comments

  # validations

  validates :username, presence: true
  validates :status, presence: true
  validates :email, presence: true, length: { minimum: 4, maximum: 254 }
  validates :status, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_with UserValidator
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  # methods 

  def login
    @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
end
