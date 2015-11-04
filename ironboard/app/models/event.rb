class Event < ActiveRecord::Base
	has_many :rsvps
	has_many :guests, through: :rsvps
	has_many :event_tags
	has_many :tags, through: :event_tags
	belongs_to :host
  accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes['name'].blank?}
  #validations 

  # starts_at and ends_at can be refactored as view object methods?
  def starts_at
  	am_pm = "AM"
		if self.start_time.hour>=12
			am_pm = "PM" 
		end
		hour = "#{self.start_time.hour%12}"
  	minutes = "#{self.start_time.min}"
  	minutes = '0'+minutes if minutes.length == 1
  	"#{hour}:#{minutes} #{am_pm}"
  end

	def ends_at
		am_pm = "AM"
  	if self.end_time.hour>12
			am_pm = "PM" 
		end
		hour = "#{self.end_time.hour%12}"
  	minutes = "#{self.end_time.min}"
  	minutes = '0'+minutes if minutes.length == 1
  	"#{hour}:#{minutes} #{am_pm}"
  end

end
