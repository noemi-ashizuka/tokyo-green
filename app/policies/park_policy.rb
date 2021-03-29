class ParkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user.admin?
  end

  def update?
    user&.admin?
  end

  def destroy?
    update?
  end

  def toggle_favorite?
    true
  end
end
