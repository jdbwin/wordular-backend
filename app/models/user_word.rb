class UserWord < ApplicationRecord

  belongs_to :user, inverse_of: :user_words
  belongs_to :word, inverse_of: :user_words

end
