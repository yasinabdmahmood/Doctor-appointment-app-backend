class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      is_admin = admin_user?
      render json: { token:, is_admin: }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def admin_user?
    current_user_id = @user.id
    admin = Admin.find_by(user_id: current_user_id)
    admin.present?
  end
end
