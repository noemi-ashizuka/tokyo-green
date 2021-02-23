class ParkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  # def new?
  #   create?
  # end

  def create?
    user.admin?
  end

  # def edit?
  #   update?
  # end

  def update?
    user.admin?
  end

  def toggle_favorite?
    true
  end
 
end
