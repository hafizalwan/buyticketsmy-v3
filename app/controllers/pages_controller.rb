class PagesController < ApplicationController
  def home
    @activities = Activity.where(active: true)
  end
end
