class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.where.not(id: current_user.id)

    # excluding the ones we already liked/disliked
    already_liked_user_ids = current_user.given_likes.pluck(:receiver_id)
    @users = @users.where.not(id: already_liked_user_ids)

    if current_user.sexual_preference == "Both"
      @users = @users.where(sexual_preference: ["Both", current_user.gender])
    else
      @users = @users.where(gender: current_user.sexual_preference)
    end

    @users = rank_users
    @users = policy_scope(@users).order("score desc")
    
    @users.each do |user|
    # raise
      PopulateCompatibilityJob.perform_now(current_user, user)
      # raise
    end

    @like = Like.new
  end

  def show
    authorize @user
  end

  def update
  end

  def chart
    authorize current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def rank_users
    # -- elements ranking

    # ELEMENTS = {
    #   water: ["Cancer","Pisces", "Scorpio"],
    #   fire: ["Leo", "Sagittarius", "Aries"],
    #   earth: ["Capricorn", "Taurus", "Virgo"],
    #   air: ["Libra", "Aquarius", "Gemini"]
    # }

    # element_ranking = ["water", "air", "earth", "fire"]

    # chart_elements.sign # Cancer

    # if user sign IN ("Cancer","Pisces", "Scorpio") alors 4
    # sinon si user sign IN ("Libra", "Aquarius", "Gemini") alors 3
    # sinon si user sign IN ("Capricorn", "Taurus", "Virgo") alors 2
    # sinon 1

    element_ranking = current_user.element_ranking

    # SQL list that will be included in a IN (...)
    elements0 = User::ELEMENTS[element_ranking[0].to_sym].map { |sign| "'#{sign}'" }.join(', ')
    elements1 = User::ELEMENTS[element_ranking[1].to_sym].map { |sign| "'#{sign}'" }.join(', ')
    elements2 = User::ELEMENTS[element_ranking[2].to_sym].map { |sign| "'#{sign}'" }.join(', ')

    # ranking_select_element = <<~SQL
    #   users.*,
    #   CASE  WHEN chart_elements.sign IN (#{elements0}) THEN 4
    #         WHEN chart_elements.sign IN (#{elements1}) THEN 3
    #         WHEN chart_elements.sign IN (#{elements2}) THEN 2
    #         ELSE 1
    #   END AS element_score
    # SQL

    # -- modes ranking
    #MODES = {
    #cardinal: ["Aries", "Capricorn", "Libra", "Cancer"],
    #fixed: ["Leo", "Taurus", "Aquarius", "Scorpio"],
    #mutable: ["Sagittarius", "Virgo", "Gemini", "Pisces"]
  #}

    mode_ranking = current_user.mode_ranking

    mode0 = User::MODES[mode_ranking[0].to_sym].map { |sign| "'#{sign}'" }.join(', ')
    mode1 = User::MODES[mode_ranking[1].to_sym].map { |sign| "'#{sign}'" }.join(', ')

    ranking_select_element = <<~SQL
      users.*,
      CASE  WHEN chart_elements.sign IN (#{elements0}) THEN 4
            WHEN chart_elements.sign IN (#{elements1}) THEN 3
            WHEN chart_elements.sign IN (#{elements2}) THEN 2
            ELSE 1
      END +
      CASE  WHEN chart_elements.sign IN (#{mode0}) THEN 3
            WHEN chart_elements.sign IN (#{mode1}) THEN 2
            ELSE 1
      END AS score
    SQL

    return @users
      .select(ranking_select_element)
      .joins("INNER JOIN chart_elements ON chart_elements.user_id = users.id AND planet = 'Sun'")
  end
end
