class MyProfilePolicy < ApplicationPolicy
  def show?
    return true
  end

  def chart?
    return true
  end
end
