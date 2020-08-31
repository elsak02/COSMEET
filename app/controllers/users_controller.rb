class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.where.not(id: current_user.id)

    # excluding the ones we already liked/disliked
    already_liked_user_ids = current_user.given_likes.pluck(:receiver_id)
    @users = @users.where.not(id: already_liked_user_ids)

    if current_user.sexual_preference == "Both"
      @users = @users.where(sexual_preference: ["Both", current_user.gender])
    else
      @users = @users.where(gender: current_user.sexual_preference)
    end

    @users = policy_scope(@users).order(created_at: :desc)
    @users.each do |user|
    # raise
      PopulateCompatibilityJob.perform_now(current_user, user)
      # raise
    end

    @like = Like.new
  end

  def show
    authorize @user
  end

  def update
  end

  def chart
    authorize current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
