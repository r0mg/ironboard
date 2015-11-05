class Event < ActiveRecord::Base
	has_many :rsvps
	has_many :guests, through: :rsvps
	has_many :event_tags
	has_many :tags, through: :event_tags
	belongs_to :host
  has_many :ratings
  accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes['name'].blank?}
  validates_presence_of :title, :day, :location, :start_time

  def self.upcoming
    self.all.where("day > ?", Date.today)
  end

  def self.past
    self.all.where("day < ?", Date.today)
  end

  def average_rating
    if ratings.count > 0
      (ratings.map {|rating| rating.stars}.inject(:+).to_f / ratings.count).round(0.5)
    else
      "Not yet rated"
    end
  end

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
