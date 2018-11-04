class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @activities = current_user.activities
  end

  private
    def require_admin
      if current_user != current_user.is_admin? || current_user.is_host?
        flash[:alert] = "You must become an admin or host to access this page!"
        redirect_to root_path
      end
    end

end
