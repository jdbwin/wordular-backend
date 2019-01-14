class User::WordsController < User::BaseController
  def create
    @params = word_request_params

    @word = Word.where(
      word: @params[:word], part_of_speech: @params[:part_of_speech]
    ).first_or_create

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
