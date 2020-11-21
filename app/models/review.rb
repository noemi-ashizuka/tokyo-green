class Review < ApplicationRecord
  belongs_to :park
  belongs_to :user

  validates :content, presence: true
  validates :content, length: { minimum: 5 }
end
