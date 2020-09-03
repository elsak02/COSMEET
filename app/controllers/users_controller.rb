class UsersController < ApplicationController
  before_action :set_user, only: [:show, :chart]
  SCORE ={}

  def index
    if current_user.name? || current_user.personality_traits.empty?
      skip_policy_scope
      return redirect_to edit_profiles_preferences_path
    end

    @users = User.active.where.not(id: current_user.id)

    # excluding the ones we already liked/disliked
    already_liked_user_ids = current_user.given_likes.pluck(:receiver_id)
    @users = @users.where.not(id: already_liked_user_ids)

    if current_user.sexual_preference == "Both"
      @users = @users.where(sexual_preference: ["Both", current_user.gender])
    else
      @users = @users.where(gender: current_user.sexual_preference)
    end

    @users = rank_users

    # RUBY
    @score = {}
    @users.each do |user|
      id = user.id
      @score[id.to_s] = score_compatibility(current_user, user).to_i
    end

    @users = policy_scope(@users).order("score desc")

    # RUBY
    @users = @users.sort_by { |user| -(user.score * 1000 + (@score[user.id.to_s] || 0)) }
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

  def score_compatibility(user_one, user_two)
      personal_planets = %w[Sun Moon Ascendant]
      secondary_planets = %w[Venus Mercury Mars]
      other_planets = %w[Saturn Jupiter Pluto Uranus Neptune]

      score = 0

      personal_planets.each do |planet|
        if condition(user_one, user_two, planet)
          score += 3
        end
      end
      secondary_planets.each do |planet|
        if condition(user_one, user_two, planet)
          score += 2
        end
      end
      other_planets.each do |planet|
        if condition(user_one, user_two, planet)
          score += 1
        end
      end

      compatibility_percentage = (score / 20.to_f) * 100

      if compatibility_percentage >= 66
        score = 3
      elsif compatibility_percentage >= 33
        score = 2
      else
        score = 1
      end
    end

  def condition(user_one, user_two, planet)
    elements_matching = {
        match_one: ["Cancer", "Pisces", "Scorpio", "Capricorn", "Taurus", "Virgo"],
        match_two: ["Leo", "Sagittarius", "Aries", "Libra", "Aquarius", "Gemini"]
      }

    user_one_sign = user_one.find_sign(planet)
    user_two_sign = user_two.find_sign(planet)

    elements_matching[:match_one].include?(user_one_sign) & elements_matching[:match_one].include?(user_two_sign) || elements_matching[:match_two].include?(user_one_sign) & elements_matching[:match_two].include?(user_two_sign)
  end


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
      END as score_element,
      CASE  WHEN chart_elements.sign IN (#{mode0}) THEN 3
            WHEN chart_elements.sign IN (#{mode1}) THEN 2
            ELSE 1
      END AS score_mode,
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
