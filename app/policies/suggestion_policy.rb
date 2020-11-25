class SuggestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all if user.admin?
    end
  end

  def create?
    true
  end

  def destroy?
    user.admin?
  end
end
