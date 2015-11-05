class Event < ActiveRecord::Base
	has_many :rsvps
	has_many :guests, through: :rsvps
	has_many :event_tags
	has_many :tags, through: :event_tags
	belongs_to :host
  validates_presence_of :title, :day

  def self.sort_by_day
   self.all.sort_by { |event| event.day }
  
  end 
 
  def validate_day?
    self.day >= Date.today
  end 

  accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes['name'].blank?}
  #validations 
end
