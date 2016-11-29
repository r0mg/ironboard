module Adapters

	class GiphyConnection
		include HTTParty

		def initialize
			@connection = self.class
		end

		def query(query)
			results = @connection.get("http://api.giphy.com/v1/gifs/search?q=#{query}&api_key=dc6zaTOxFJmzC")
		end

	end

end
