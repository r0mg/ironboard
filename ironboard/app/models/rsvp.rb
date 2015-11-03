class Rsvp < ActiveRecord::Base
	belongs_to :guest
	belongs_to :event
	# belongs_to :attended_event, class_name: "Rsvp"
end
