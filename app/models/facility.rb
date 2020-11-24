class Facility < ApplicationRecord
  has_many :park_facilities, dependent: :destroy
  has_one_attached :photo

  def self.all_attractions
    Facility.where("is_attraction")
  end

  def self.all_facilities
    Facility.where(is_attraction: false)
  end
end
