class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @receiver = User.find(params[:id])
    @like = Like.create(like_params)
    @like.user = current_user
    @like.receiver = @receiver
  end

  def like_params
    params.require(:like).permit(:receiver_id, :liked)
  end
end
