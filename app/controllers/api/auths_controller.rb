class Api::AuthsController < Api::BaseController
  def create
    if user = User.valid_login?(params[:email], params[:password])
      user.regenerate_token
      render json: {token: user.token}, status: :ok
    else
      render json: {errors: [{detail: "Invalid email or password"}]}, status: :unauthorized
    end
  end
end
