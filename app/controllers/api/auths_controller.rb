class Api::AuthsController < Api::BaseController
  before_action :authenticate!
  def create
    if user = User.valid_login?(params[:email], params[:password])
      user.regenerate_token
      render json: {token: user.token}, status: :ok
    else
      render json: {errors: [{detail: "Invalid email or password"}]}, status: :unauthorized
    end
  end

  def destroy
    current_user.update_columns token: nil
    render status: :ok
  end
end
