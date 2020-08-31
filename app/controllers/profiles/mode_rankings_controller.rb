class Profiles::ModeRankingsController < Profiles::PreferencesController
  def update
    authorize current_user
    form = ModeRankingsForm.new(profile_params)
    if form.valid?
      current_user.update(profile_params)
      redirect_to users_path
    else
      render :edit
    end
  end
end
