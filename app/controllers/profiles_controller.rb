class ProfilesController < ApplicationController
  def public
    @user = User.find(params[:id])
  end

  def private
    @user = User.find(current_user)
  end

  def edit
  end

  def update
  end
end
