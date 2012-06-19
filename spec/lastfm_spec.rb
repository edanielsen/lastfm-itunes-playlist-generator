require File.join(File.dirname(__FILE__), '../lib/lastfm-itunes-playlist-generator/lastfm')

describe LastFM do
	before :each do
		@lastfm = LastFM.new
	end

	describe 'similar artists' do

		before :each do
			@artists ||= @lastfm.similar_artists 'Bruce Springsteen'
		end

		it 'should return list of artists based on given artist' do
			@artists.should_not be_empty
		end

		it "should return the name for each given artist" do
			@artists.each { |artist| artist[:name].should_not be_nil }
		end

		it "should return the 'likeness' to the given artist" do
			@artists.each { |artist| artist[:likeness].should_not be_nil }
		end

	end	
end
