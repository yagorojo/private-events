class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @attendance = @user.attended_events
  end
end
