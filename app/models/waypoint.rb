class Waypoint < ActiveRecord::Base
include Geokit::Geocoders
  belongs_to :trip
  
  before_create :get_location
  
  def get_location
  result = GoogleGeocoder.reverse_geocode([self.latitude, self.longitude])
  self.location =  result.full_address
  end
  
   #OB341823
   #OB341845
end
