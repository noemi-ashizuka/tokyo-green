class Park < ApplicationRecord
  validates :name, :address, presence: true
  belongs_to :admin, class_name: "User", foreign_key: "user_id"

  acts_as_favoritable
  
  FACILITIES = ["toilets", "tennis court", "wheelchair accessible", "baby changing", "picnic area", "drink stand", "cafe", "soccer field", "baseball field", "open air stage"]
  ATTRACTIONS = ["large lawn", "boat riding", "historical site", "nature reserve", "bird watching", "cherry blossoms"]
  BEST_SEASON = ["summer", "autumn", "spring", "winter"]
end
