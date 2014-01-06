class Car < ActiveRecord::Base

  validates :color, length: { minimum: 1 }
  validates_numericality_of :year, only_integer: true, allow_nil: false
  validates_numericality_of :mileage, only_integer: true, allow_nil: false
end
