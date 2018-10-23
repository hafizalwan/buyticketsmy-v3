class GuestReviewsController < ApplicationController

  def create

    @reservation = Reservation.where(
                    id: guest_review_params[:reservation_id],
                    activity_id: guest_review_params[:activity_id],
                    user_id: guest_review_params[:user_id]
                    ).first

    if !@reservation.nil?
      @has_reviewed = GuestReview.where(
                      reservation_id: @reservation_id,
                      user_id: guest_review_params[:user_id],
                      ).first
      if @has_reviewed.nil?
        @guest_review = current_user.guest_reviews.create(guest_review_params)
        flash[:success] = "Your review has been created!"
      else
        flash[:success] = "You can only place one review on each reservation!"
    else
      flash[:alert] = "Reservation not found!"
    end

    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @guest_review = Review.find(params[:id])
    @guest_review.destroy
    redirect_back(fallback_location: request.referer, notice: "Your review has been removed")
  end

  private
    def guest_review_params
      params.require(:guest_reviews).permit(:comment, :star, :activity_id, :reservation_id)
    end
end
