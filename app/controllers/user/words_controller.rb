class User::WordsController < User::BaseController
  def create
    @word = word_request_params

    @word = Word.find_or_create_by(word: @word[:word])

    @user_word = @current_user.user_words.new(word: @word)

    @user_word.save
  end

  private

  def word_request_params
    params.require(:word).permit(
      :word,
      :part_of_speech
    )
  end
end
