class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.user = current_user
    authorize @like
    @like.save
    if @like.liked?
      match = @like.create_match
      redirect_to match_path(match) if match
    end
  end

  def like_params
    params.require(:like).permit(:receiver_id, :liked)
  end
end
