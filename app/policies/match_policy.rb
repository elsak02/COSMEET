class MatchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.matches
      # scope.where.not(id: current_user.id)
    end
  end

  def show?
    return true
  end

  def chatroom?
    return true
  end
end

