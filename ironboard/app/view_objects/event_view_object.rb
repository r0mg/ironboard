class EventViewObject

  def initialize(event)
    @event = event
  end

  def starts_at
  	am_pm = "AM"
		am_pm = "PM" if @event.start_time.hour>=12
		hour = "#{@event.start_time.hour%12}"
  	minutes = "#{@event.start_time.min}"
  	minutes = '0'+minutes if minutes.length == 1
  	"#{hour}:#{minutes} #{am_pm}"
  end

	def ends_at
		am_pm = "AM" 	
		am_pm = "PM" if @event.end_time.hour>12
		hour = "#{@event.end_time.hour%12}"
  	minutes = "#{@event.end_time.min}"
  	minutes = '0'+minutes if minutes.length == 1
  	"#{hour}:#{minutes} #{am_pm}"
  end

end