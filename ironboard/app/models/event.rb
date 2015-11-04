class Event < ActiveRecord::Base
	has_many :rsvps
	has_many :guests, through: :rsvps
	has_many :event_tags
	has_many :tags, through: :event_tags
	belongs_to :host

  def sort
    binding.pry
    # @events = @event.sort_by! {|event| event.day }
  end   
end
