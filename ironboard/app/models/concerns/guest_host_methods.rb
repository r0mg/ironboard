module GuestHostMethods

  def attended_events
    self.events.past
  end

  def upcoming_events
    self.events.upcoming
  end

end