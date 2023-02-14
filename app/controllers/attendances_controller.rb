class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @event = Event.find(params[:event_id])
    @attendance = current_user.attendance.build(
      attended_event_id: @event.id
    )

    if @attendance.save
      flash[:notice] = "Attending to #{@event.name}!"
      redirect_to @event
    else
      flash[:alert] = "An error has ocurred."
      redirect_to @event
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @attendance = current_user.attendance.find_by(
      attended_event_id: params[:event_id]
    )

    if @attendance.destroy
      redirect_to @event
    end
  end
end