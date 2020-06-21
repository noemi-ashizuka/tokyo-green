class ParkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def show?
      true
    end

    def new?
      create?
    end

    def create?
      user.admin?
    end
  end
end
