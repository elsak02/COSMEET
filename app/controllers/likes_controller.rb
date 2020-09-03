class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.user = current_user
    # binding.pry
    authorize @like
    if @like.save
      #if @like.liked?
        # match = @like.create_match
        # if match
          # redirect_to match_path(match)
        # else
          #redirect_to users_path
        # end
      #else
        #redirect_to users_path
      #end
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  def like_params
    params.require(:like).permit(:receiver_id, :liked)
  end
end
