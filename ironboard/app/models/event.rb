class Event < ActiveRecord::Base
	has_many :rsvps
	has_many :guests, through: :rsvps
	has_many :event_tags
	has_many :tags, through: :event_tags
	belongs_to :host
<<<<<<< HEAD

  def sort
    binding.pry
    # @events = @event.sort_by! {|event| event.day }
  end   
=======
  accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes['name'].blank?}
  #validations 
>>>>>>> e7753d5acb762068b89703b9f69b9b4c9592c303
end
