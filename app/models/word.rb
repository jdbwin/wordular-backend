class Word < ApplicationRecord

  validates :word, presence: true, uniqueness: :true

  has_many :user_words
  has_many :users, through: :user_words

end
