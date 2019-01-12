class UsersController < ApplicationController

  def create
    @user = User.create(user_request_params)

    if @user.save
      render json: @user
    else
      head :internal_server_error
    end
  end

  private

  def user_request_params
    params.require(:user).permit(
      :name,
      :email,
      :password
    )
  end

end
