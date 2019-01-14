class User::BaseController < ApplicationController
  before_action :authenticate_request

  protected

  def authenticate_request
    begin
      @current_user = User.find(token_details[:user_id])
    rescue JWT::VerificationError, JWT::DecodeError, ActiveRecord::RecordNotFound
      head :unauthorized
    end
  end

  private

  def token_present?
    request.headers["Authorization"].present?
  end

  def token_details
    details = Token.decode(request.headers["Authorization"])

    if details.nil?
      raise JWT::VerificationError
    end

    details
  end

end
