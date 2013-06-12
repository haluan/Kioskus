class Location < ActiveRecord::Base
  acts_as_gmappable
  attr_accessible :gmaps, :jalan, :kota, :latitude, :longitude, :nama, :provinsi, :photo
  geocoded_by :address, :units=> :km
  after_validation :geocode
  
  has_attached_file :photo,:styles => { :small => "150x150>" }
  def address
    [jalan,kota,provinsi].compact.join(',')
  end
  def gmaps4rails_address
  "#{jalan}, #{kota}, #{provinsi}"
end
end
