class Facility < ApplicationRecord
  has_many :park_facilities

  def self.all_attractions
    Facility.where("is_attraction")
  end
end
