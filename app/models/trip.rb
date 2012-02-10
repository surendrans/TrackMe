class Trip < ActiveRecord::Base

	has_many :waypoints
	
	before_save :find_latlong
	
	def find_latlong
	starting_place =	Geokit::Geocoders::GoogleGeocoder.geocode(self.starting)
	destination_place = Geokit::Geocoders::GoogleGeocoder.geocode(self.destination)
		self.start_latlong = starting_place.ll
		self.destination_latlong = destination_place.ll
	end
end
