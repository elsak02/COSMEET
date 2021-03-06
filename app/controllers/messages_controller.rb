class MessagesController < ApplicationController
  def create
    @chatroom = Match.find(params[:match_id])
    @message = Message.new(message_params)
    @message.match = @chatroom
    @message.user = current_user
    authorize @message
    if @message.save
      MatchChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message, user: current_user })
      )
      redirect_to chatroom_match_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
