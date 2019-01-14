class UserWord < ApplicationRecord

  validates :word_id, :user_id, presence: true, uniqueness: {
    scope: :word_id
  }

  belongs_to :user, inverse_of: :user_words
  belongs_to :word, inverse_of: :user_words

end
