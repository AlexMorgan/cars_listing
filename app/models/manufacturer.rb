class Manufacturer < ActiveRecord::Base
  has_many :cars

  validates :name, presence: true
  validates :country,
    presence: true,
    uniqueness: { scope: :name }
end
