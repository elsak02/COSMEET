class ModeRankingsForm
  include ActiveModel::Model

  attr_accessor(
    :mode_ranking
  )

  validates :mode_ranking, presence: true
end
