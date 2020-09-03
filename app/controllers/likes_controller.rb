class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.user = current_user
    # binding.pry
    authorize @like
    if @like.save
      if @like.liked?
        match = @like.create_match
        if match
          render json: { success: true, redirect_url: match_path(match) }
          #redirect_to match_path(match)
        else
          render json: { success: true }
        end
      else
        render json: { success: true }
      end
    else
      render json: { success: false }
    end
  end

  def like_params
    params.require(:like).permit(:receiver_id, :liked)
  end
end
