class Profiles::ModeRankingsController < Profiles::PreferencesController
  def update
    authorize current_user
    form = ModeRankingsForm.new(profile_params)
    form.user = current_user
    if form.valid?
      form.save
      redirect_to users_path
    else
      flash[:alert] = form.errors.full_messages.join(", ")
      render :edit
    end
  end
end
