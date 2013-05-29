class Checkin < ActiveRecord::Base
  attr_accessible :location, :title, :latitude, :longitude
  belongs_to :car

  scope :nearby_to,
        lambda { |checkin, max_distance|
          where("ST_DWithin(location, ?, ?) AND id != ?", checkin.location, max_distance, checkin.id)
        }

  def latitude
    self.location.nil? ? 0 : self.location.y
  end

  def latitude=(value)
    self.location = "POINT(#{longitude} #{value})"
  end

  def longitude
    self.location.nil? ? 0 : self.location.x
  end

  def longitude=(value)
    self.location = "POINT(#{value} #{latitude})"
  end
end
