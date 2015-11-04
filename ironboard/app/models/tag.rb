class Tag < ActiveRecord::Base
	has_many :event_tags
	has_many :events, through: :event_tags

	def giphy_url
		giphy_client = Adapters::GiphyClient.new
    	giphy_client.find_by_tag(self.name.gsub(' ','+'))
	end
end
