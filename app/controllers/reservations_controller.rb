class ReservationsController < ApplicationController
  def index
    @reservations = @current_user.reservations
    render json: @reservations
  end

  def create
  end
end
