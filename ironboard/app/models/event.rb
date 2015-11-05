class Event < ActiveRecord::Base
	has_many :rsvps
	has_many :guests, through: :rsvps
	has_many :event_tags
	has_many :tags, through: :event_tags
	belongs_to :host
  validates_presence_of :title, :day
  has_many :ratings
  accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes['name'].blank?}
  validates_presence_of :title, :day, :location, :start_time


  def self.upcoming
    self.all.where("day >= ?", Date.today)
  end

  def self.past
    self.all.where("day < ?", Date.today)
  end
 
 def self.sort_by_day
   self.all.sort_by { |event| event.day }
  end 
 
  def validate_day?
    self.day >= Date.today
  end 

  def average_rating
      (ratings.map {|rating| rating.stars}.inject(:+).to_f / ratings.count).round(0.5)
  end

end
