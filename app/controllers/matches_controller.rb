class MatchesController < ApplicationController
  def index
    @matches = policy_scope(Match).order('created_at desc')
  end

  def show
    @match = Match.find(params[:id])
    @match_description = PopulateCompatibilityJob.perform_now(@match.user_matches.first.user, @match.user_matches.last.user)
    authorize @match
  end

  def chatroom
    @chatroom = Match.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end
end
