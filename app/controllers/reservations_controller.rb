class ReservationsController < ApplicationController
  def index
    @reservations = @current_user.reservations
    render json: @reservations
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:doctor_id, :date, :city)
  end
end
end
