class ActivitiesForm
  include ActiveModel::Model

  attr_accessor(
    :activities,
    :user
  )

  def initialize(params)
    @activities = params[:activities]&.split(",")
  end

  def save
    @user.update(activities: @activities)
  end


  validates :activities, presence: true
end

