class Park < ApplicationRecord
  validates :name, :address, presence: true
end
