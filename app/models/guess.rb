class Guess < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :speed_limit, :speed, :street, :city, :state
  geocoded_by :address
  
  before_save { address.downcase! }
  
  validates :address, presence: true, length: { maximum: 100 }
  validates :speed, presence: true, length: { maximum: 3 }
  validates :speed_limit, presence: true, length: { maximum: 3 }
  
  after_validation :geocode
  
  self.per_page = 3
  
end
