class Guest < ActiveRecord::Base

  has_many :ratings
  belongs_to :user
  has_many :rsvps
  has_many :events, through: :rsvps

<<<<<<< HEAD


    
=======
  include GuestHostMethods

  def rate(event, rating)
    if self.past_events.include?(event)
      Rating.create(event_id: event.id, stars: rating, guest_id: self.id)
    end
  end

  def rated?(user, event)
    Rating.find_by(guest_id: user.id, event_id: event.id)
  end

>>>>>>> be4d37dbf83e8e08df76a716aaef37af6a818d69
end
