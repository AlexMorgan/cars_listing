class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :color, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1920 }
  validates :mileage, presence: true, numericality: { only_integer: true }
  validates :manufacturer_id, presence: true
end
