class RevenuesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @reservations = Reservation.current_week_revenue(current_user)

    @this_week_revenue = @reservations.map {|r| {r.updated_at.strftime('%Y-%m-%d') => r.total}}
                                      .inject({}) {|a,b| a.merge(b) {|_,x,y| x + y}}

    @this_week_revenue = Date.today().all_week.map { |date| [date.strftime('%a'), @this_week_revenue[date.strftime('%Y-%m-%d')] || 0 ]}
  end

  private
    def require_admin
      if !current_user.is_admin?
        flash[:alert] = "Only an admin can perform this action!"
        redirect_to root_path
      end
    end

end
