class RevenuesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @reservations = Reservation.current_week_revenue(current_user)

    @this_week_revenue = @reservations.map {|r| {r.updated_at.strftime('%Y-%m-%d') => r.total}}
                                      .inject({}) {|a,b| a.merge(b) {|_,x,y| x + y}}
  end

  private
    def require_admin
      if !current_user.is_admin?
        flash[:alert] = "Only an admin can perform this action!"
        redirect_to root_path
      end
    end

end
