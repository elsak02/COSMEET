class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.where.not(id: current_user.id)
    @users = policy_scope(User).order(created_at: :desc)
  end

  def show
    authorize @user
  end
  def update
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
