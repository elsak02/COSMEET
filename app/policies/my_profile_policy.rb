class MyProfilePolicy < ApplicationPolicy
  def show?
    return true
  end

  def chart?
    return true
  end

  def edit?
    return true
  end

  def update?
    return true
  end
end
