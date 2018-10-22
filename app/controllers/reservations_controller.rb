class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    activity = Activity.find(params[:activity_id])

    @reservation = current_user.reservations.build(reservation_params)
    @reservation.activity = activity
    @reservation.total = (activity.my_adult_price * @reservation.my_adult_count) + (activity.my_child_price * @reservation.my_child_count) + (activity.int_adult_price * @reservation.int_adult_count) + (activity.int_child_price * @reservation.int_child_count)
    @reservation.save

    flash[:notice] = "Booked successfully"

  end

  def your_activities
    @bookings = current_user.reservations.order(arrival: :asc)
  end

  private
    def reservation_params
      params.require(:reservation).permit(:arrival, :my_adult_count, :my_child_count, :int_adult_count, :int_child_count)
    end

end
