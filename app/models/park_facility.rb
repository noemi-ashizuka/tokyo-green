class ParkFacility < ApplicationRecord
  belongs_to :park
  belongs_to :facility
end
