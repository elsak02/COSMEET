class Profiles::ElementRankingsController < Profiles::PreferencesController
  def update
    authorize current_user
    form = ElementRankingsForm.new(profile_params)
    form.user = current_user
    if form.valid?
      form.save
      redirect_to edit_profiles_mode_rankings_path
    else
      flash[:alert] = form.errors.full_messages.join(", ")
      render :edit
    end
  end
end
