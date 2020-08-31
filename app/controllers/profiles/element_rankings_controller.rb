class Profiles::ElementRankingsController < Profiles::PreferencesController
  def update
    authorize current_user
    form = ElementRankingsForm.new(profile_params)
    if form.valid?
      current_user.update(profile_params)
      redirect_to edit_profiles_mode_rankings_path
    else
      render :edit
    end
  end
end
