class User < ActiveRecord::Base
	# has_many :events, foreign_key: "host_id"
	# has_many :rsvps, foreign_key: "guest_id"
	# # has_many :attendances, through: :rsvps
	# has_many :attended_events, class_name: "Rsvp", foreign_key: "guest_id"
  has_one :guest
  has_one :host 
  
  has_secure_password
  validates_uniqueness_of :name 
  validates_presence_of :name 
  

end
