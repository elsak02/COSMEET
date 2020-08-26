class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where.not(id: current_user.id)
    end
   end

  def index?
    return true
  end

  def show?
    return true
  end

  def update?
    record == user
  end

end
