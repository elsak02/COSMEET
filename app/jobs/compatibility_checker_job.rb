class CompatibilityCheckerJob < ApplicationJob
  queue_as :default

  def perform(user)
    @users = User.where.not(id: user.id)

    # excluding the ones we already liked/disliked
    already_liked_user_ids = user.given_likes.pluck(:receiver_id)
    @users = @users.where.not(id: already_liked_user_ids)

    if user.sexual_preference == "Both"
      @users = @users.where(sexual_preference: ["Both", user.gender])
    else
      @users = @users.where(gender: user.sexual_preference)
    end

     @users.each do |other_user|
      existing_compat = user.compatibilities.find_by(receiver: other_user)
      PopulateCompatibilityJob.perform_later(user, other_user) unless existing_compat
    end
  end
end


