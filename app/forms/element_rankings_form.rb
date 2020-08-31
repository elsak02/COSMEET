class ElementRankingsForm
  include ActiveModel::Model

  attr_accessor(
    :element_ranking,
    :user
  )

  def initialize(params)
    @element_ranking = params[:element_ranking]&.split(",")
  end

  def save
    @user.update(element_ranking: @element_ranking)
  end


  validates :element_ranking, presence: true
end

