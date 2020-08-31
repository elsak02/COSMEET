class Profiles::ModeRankingsController < Profiles::PreferencesController
  def update
    authorize current_user
    form = ModeRankingsForm.new(profile_params)
    form.user = current_user
    if form.valid?
      form.save
      redirect_to edit_profiles_personality_traits_path
    else
      flash[:alert] = form.errors.full_messages.join(", ")
      render :edit
    end
  end
end
