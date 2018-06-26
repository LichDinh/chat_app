class Api::V1::SessionsController < Devise::SessionsController
  before_action :check_params, only: :create
  before_action :set_user, only: :create

  def create
    if @user.valid_password?(user_params[:password])
      sign_in :user, @user
      message = 'Signed In Successfully'
      status = :ok
    else
      message = 'Signed In Failed - Unauthorized'
      status = :unauthorized
    end
    render json: {
      message: message
    }, status: status
  end

  private
  def check_params
    return if params[:user].present?
    render json: {
      message: 'Params missing'
    }, status: :bad_request
  end

  def user_params
    params.require(:user).permit(:login, :password)
  end

  def set_user
    @user = User.find_user_email_or_username(user_params[:login])
  end
end
