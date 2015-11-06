class RatingsController < ApplicationController

  def create
    rating = Rating.find_or_create_by(guest_id: current_user.guest.id, event_id: params[:id])
    rating.update(stars: params[:rating][:stars])
    rating.save
    redirect_to guest_past_events_path(current_user)
  end

end
