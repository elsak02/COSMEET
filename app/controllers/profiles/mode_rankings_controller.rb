class Profiles::ModeRankingsController < Profiles::PreferencesController
  def update
    authorize current_user
    current_user.assign_attributes(profile_params)
    if current_user.save
      redirect_to edit_profiles_personality_traits_path
    else
      render :edit
    end
  end
end
