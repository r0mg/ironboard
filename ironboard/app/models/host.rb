class Host < ActiveRecord::Base

  belongs_to :user
  has_many :events
  has_many :guests, through: :events

  include GuestHostMethods

  def self.with_the_most
  	# host with the largest number of guests
  	Host.select('hosts.*,count(guests.id) as guest_count').joins(:guests).
  	group('hosts.id').order('guest_count desc limit 1')
  end
  
end
