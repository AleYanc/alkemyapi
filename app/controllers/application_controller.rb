class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include ActionController::HttpAuthentication::Token
  def authenticate_user
    token, _options = token_and_options(request)
    user_id = AuthTokenService.decode(token)
    User.find(user_id)
  rescue ActiveRecord::RecordNotFound
    render status: :unauthorized
  rescue JWT::DecodeError
    render json: {msg: 'You are not authorized to perform that action'}, status: :unauthorized
  end
end
