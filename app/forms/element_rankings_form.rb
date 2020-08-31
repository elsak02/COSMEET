class ElementRankingsForm
  include ActiveModel::Model

  attr_accessor(
    :element_ranking
  )

  validates :element_ranking, presence: true
end

