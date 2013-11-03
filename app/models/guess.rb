class Guess < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :speed_limit, :speed, :street, :city, :state
  attr_accessible :full_address
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude, :address => :full_address, :state_code => :state
  
  validates :address, presence: true, length: { maximum: 100 }
  validates :speed, presence: true, length: { maximum: 3 }
  validates :speed_limit, presence: true, length: { maximum: 3 }
  
  after_validation :geocode, :reverse_geocode
  
  self.per_page = 3
  
#  def address
#    [street, city, state, country].compact.join(', ')
#  end
    
  
end
