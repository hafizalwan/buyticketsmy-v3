class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @activity = @user.activity
  end
end
