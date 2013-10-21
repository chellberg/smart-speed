class Guess < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :speed_limit, :speed, :street, :city, :state
  geocoded_by :address
  after_validation :geocode
  
end
