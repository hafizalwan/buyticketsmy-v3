class PagesController < ApplicationController
  def home
    @activities = Activity.where(active: true).limit(3)
  end
end
