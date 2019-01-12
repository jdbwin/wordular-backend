class User < ApplicationRecord
  has_secure_password

  validates :email, :password, :name, presence: true
  validates :email, uniqueness: :true

  has_many :user_words, inverse_of: :user, dependent: :destroy
  has_many :words, through: :user_words

end
