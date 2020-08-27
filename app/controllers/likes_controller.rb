class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.user = current_user
    authorize @like
    @like.save
  end

  def like_params
    params.require(:like).permit(:receiver_id, :liked)
  end
end
