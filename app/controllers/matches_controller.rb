class MatchesController < ApplicationController
  def index
    @matches = policy_scope(Match)
  end

  def show
    @match = Match.find(params[:id])
    authorize @match
  end

  def chatroom
    @chatroom = Match.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end
end
