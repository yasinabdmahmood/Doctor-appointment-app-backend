class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: @doctors.to_json
  end

  def create
    doctor = Doctor.new(user_params)
    if admin_user?
      if doctor.save
        render json: { status: "success", message: "Doctor created successfully" }, status: :created
      else 
        render json: { status: "error", errors: doctor.errors }, status: :unprocessable_entity
      end
    else
      render json: { status: "error", message: "You are not admin" }, status: :unauthorized
    end
  end

  def destroy
    if admin_user?
      doctor = Doctor.find(params[:id])
      if doctor.destroy
        render json: {message: "Doctor deleted successfully"}, status: :ok
      else
        render json: {error: "Unable to delete doctor"}, status: :unprocessable_entity
      end
    else
      render json: {error: "You are not admin"}, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:name, :picture, :speciality, :bio)
  end

  def admin_user?
    current_user_id = @current_user.id
    admin = Admin.find_by(user_id: current_user_id)
    admin.present?
  end
end
