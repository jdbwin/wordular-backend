class AuthController < ApplicationController

  def login
    @auth = auth_request_params

    unless @auth
      head :unauthorized
    end

    @user = User.find_by(email: @auth[:username])

    if @user && @user.authenticate(@auth[:password])
      render json: {
        token: Token.encode(user_id: @user.id)
      }
    else
      head :unauthorized
    end
  end

  private

  def auth_request_params
    params.require(:auth).permit(
      :username,
      :password
    )
  end

end

