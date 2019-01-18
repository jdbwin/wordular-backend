class HomeController < ApplicationController

  def index
    @words = Word.all

    @top = @words.order(user_count: :desc).first(5)
    @random = @words.shuffle.first(5)
    @recent = @words.order(created_at: :desc).first(5)

    render json: {
      top: @top,
      random: @random,
      recent: @recent
    }
  end

end
