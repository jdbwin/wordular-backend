class User < ApplicationRecord
  has_secure_password

  has_many :user_words, inverse_of: :user, dependent: :destroy
  has_many :words, through: :user_words

end
