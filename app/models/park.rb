class Park < ApplicationRecord
  validates :name, :address, presence: true
  belongs_to :admin, class_name: "User", foreign_key: "user_id"
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  acts_as_favoritable

  # temporary fix for the format of the string until models for attractions and facilities are created
  # also check helper
  before_save :fix_facilities_string, :fix_attractions_string

  def fix_facilities_string
    self.facilities.gsub!(/[\[\]\",]/, "") if attribute_present?("facilities")
  end 

  def fix_attractions_string
    self.attractions.gsub!(/[\[\]\",]/, "") if attribute_present?("attractions")
  end
  
  FACILITIES = ["toilets", "tennis court", "wheelchair accessible", "baby changing", "picnic area", "drink stand", "cafe", "soccer field", "baseball field", "open air stage", "playground"]
  ATTRACTIONS = ["large lawn", "boat riding", "historical site", "nature reserve", "bird watching", "cherry blossoms"]
  BEST_SEASON = ["summer", "autumn", "spring", "winter"]
end
