require 'httparty'
require 'nokogiri'
require 'cgi'

class LastFM
	def similar_artists artist
		xml = query_by_filter('artist.getSimilar', {:artist => artist, :autocorrect => 1})
		xml.xpath("//artist").collect do |artist|
			{:name => artist.xpath('./name').first.content, :likeness => artist.xpath('./match').first.content}
		end
	end

	private
	def query_by_filter method, filter
		response = HTTParty.get("http://ws.audioscrobbler.com/2.0/?api_key=af67dd7e43569799e5033f12481b9509&method=#{method}", :query => filter)
		puts response.inspect
		puts response.body
		Nokogiri::XML(CGI::unescapeHTML(response.body))
	end
end
