class Park < ApplicationRecord
  validates :name, :address, presence: true
  belongs_to :admin, class_name: "User"
end
