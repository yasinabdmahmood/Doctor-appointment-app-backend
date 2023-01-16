class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: @doctors.to_json
  end

  def create; end

  def destroy; end
end
