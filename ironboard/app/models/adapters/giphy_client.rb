module Adapters

	class GiphyClient
		def connection
			@connection = Adapters::GiphyConnection.new
		end

		def find_by_tag(tag_name)
			results = connection.query(tag_name)
			random_gif = results.data.sample
			"https://media.giphy.com/media/#{random_gif.id}/giphy.gif"
		end

	end

end