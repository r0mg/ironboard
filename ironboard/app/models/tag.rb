class Tag < ActiveRecord::Base
	has_many :event_tags
	has_many :events, through: :event_tags
  validates_uniqueness_of :name
  validates_presence_of :name
  
	def giphy_url
		giphy_client = Adapters::GiphyClient.new
    	giphy_client.find_by_tag(self.name.tr(' ','+'))
	end

  def unique_events
    self.events.uniq
  end

end
