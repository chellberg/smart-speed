class Guess < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :speed_limit, :speed, :street, :city, :state
  attr_accessible :full_address, :notes
 
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude, :address => :full_address, :state_code => :state
  
  validates :street, length: { maximum: 100 }
  validates :city, presence: true, length: { maximum: 100 }
  validates :state, presence: true, length: { maximum: 2 }
  validates :speed, presence: true, length: { maximum: 3 }
  validates :speed_limit, presence: true, length: { maximum: 3 }
  
  after_validation :geocode, :reverse_geocode
  
  self.per_page = 3
  
  def address
    [street, city, state].compact.join(', ')
  end
    
 # def self.search(search)
#    if search
#      find(:all, :conditions => ['full_address LIKE ?', "%#{search}%"])
#    else
#      find(:all)
#    end
#  end
  
end
