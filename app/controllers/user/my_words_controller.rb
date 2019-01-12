class User::MyWordsController < User::BaseController

  def index
    render json: @current_user.words
  end

end
