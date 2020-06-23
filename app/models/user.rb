class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :parks
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  def set_default_role
    self.role ||= :user
  end
end
