class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.user = current_user
    authorize @like
    @like.save
    match = @like.create_match
    redirect_to match_path(match) if match
  end

  def like_params
    params.require(:like).permit(:receiver_id, :liked)
  end
end
