class PagesController < ApplicationController
  def home
    @activity = Activity.find(params[:id])
  end
end
