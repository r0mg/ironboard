class Guest < ActiveRecord::Base

  has_many :ratings
  belongs_to :user
  has_many :rsvps
  has_many :events, through: :rsvps

  include GuestHostMethods

  def rate(event, rating)
    if self.past_events.include?(event)
      Rating.create(event_id: event.id, stars: rating, guest_id: self.id)
    end
  end

end
