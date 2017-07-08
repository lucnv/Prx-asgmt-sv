class Api::AuthsController < Api::BaseController
  def create
    if user = User.valid_login?(params[:email], params[:password])
      user.regenerate_token
      render json: {token: user.token}
    else
      render json: {errors: [{detail: "Invalid email or password"}]}
    end
  end
end
