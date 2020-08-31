class ModeRankingsForm
  include ActiveModel::Model

  attr_accessor(
    :mode_ranking,
    :user
  )

  def initialize(params)
    @mode_ranking = params[:mode_ranking]&.split(",")
  end

  def save
    @user.update(mode_ranking: @mode_ranking)
  end

  validates :mode_ranking, presence: true
end
