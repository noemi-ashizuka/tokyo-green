class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :parks
  has_many :reviews, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record? # :if => :new_record?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_favoritor
  has_one_attached :photo

  def set_default_role
    self.role ||= :user
  end
end
