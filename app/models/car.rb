class Car < ActiveRecord::Base
  attr_accessible :car_model, :color, :driver_id, :number
  has_many :checkins
  belongs_to :driver
end
