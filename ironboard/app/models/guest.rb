class Guest < ActiveRecord::Base

  has_many :ratings
  belongs_to :user
  has_many :rsvps
  has_many :events, through: :rsvps

  def rate(event, rating)
    Rating.create(event_id: event.id, stars: rating, guest_id: self.id)
  end

end
