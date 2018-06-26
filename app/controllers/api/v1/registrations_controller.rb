class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :check_params, only: :create

  def create
    user = User.new user_params
    if user.save
      message = 'Sign up successfully'
      status = :ok
    else
      message = 'Sign up fail'
      data = user.errors.full_messages
      status = :unprocessable_entity
    end
    render json: {
      message: message,
      data: data || {}
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
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
