class Profiles::BirthInfosController < Profiles::PreferencesController
  def update
    authorize current_user
    current_user.assign_attributes(profile_params)
    if current_user.save
      PopulateChartElement.perform_later(current_user)
      redirect_to edit_profiles_photos_path
    else
      render :edit
    end
  end
end
