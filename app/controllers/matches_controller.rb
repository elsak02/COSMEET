class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
    authorize @match
  end
end
