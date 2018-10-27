class PagesController < ApplicationController
  def home
    @activities = Activity.find(params[:id])
  end
end
