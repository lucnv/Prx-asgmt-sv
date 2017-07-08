class Api::BaseController < ActionController::API
  def require_login
    unless authenticate_token
      render json: {errors: [{detail: "Access denied"}]}, status: :unauthorized
    end
  end

  def current_user
    @current_user ||= authenticate_token
  end

  private
  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by token: token
    end
  end
end
