class Park < ApplicationRecord
  validates :name, :address, presence: true
  belongs_to :admin, class_name: "User", foreign_key: "user_id"
  # belongs_to :user
end
