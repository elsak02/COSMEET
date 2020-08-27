class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    if current_user.sexual_preference == "both"
      @users = User.where.not(id: current_user.id)
    else
      @users = User.where.not(id: current_user.id).where(gender: current_user.sexual_preference)
    end
    @users = policy_scope(@users).order(created_at: :desc)
    @like = Like.new
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
