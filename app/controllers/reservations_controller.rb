class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin, only: [:your_reservations]
  before_action :set_reservation, only: [:approve, :decline]

  def create
    activity = Activity.find(params[:activity_id])

    if current_user == activity.user
      flash[:alert] = "An admin cannot make a reservation!"
    else
      @reservation = current_user.reservations.build(reservation_params)
      @reservation.activity = activity
      @reservation.total = (activity.my_adult_price * @reservation.my_adult_count) + (activity.my_child_price * @reservation.my_child_count) + (activity.int_adult_price * @reservation.int_adult_count) + (activity.int_child_price * @reservation.int_child_count)

      if @reservation.save
        redirect_to reservation_success_path
        flash[:notice] = "Reservation created successfully!"
      else
        flash[:alert] = "Something is wrong, please try again!"
      end
    end
  end

  def success
  end

  def your_activities
    @bookings = current_user.reservations.order(arrival: :asc)
  end

  def your_reservations
    @activities = current_user.activities
  end

  def approve
    @reservation.Approved!
    redirect_to your_reservations_path
  end

  def decline
    @reservation.Declined!
    redirect_to your_reservations_path
  end

  private

    def require_admin
      if !current_user.is_admin?
        flash[:alert] = "You must become an admin to access this page!"
        redirect_to root_path
      end
    end

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:arrival, :my_adult_count, :my_child_count, :int_adult_count, :int_child_count)
    end
end
