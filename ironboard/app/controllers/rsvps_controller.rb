class RsvpsController < ApplicationController

def create
  @event = Event.find(params[:id])
  if !@event.guests.include?(current_user.guest)
  @event.guests << current_user.guest
  else
    flash[:notice] = "You're already attending this event!"
  end
  render 'events/show' 
end

end
