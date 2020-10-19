class Profiles::ActivitiesController < Profiles::PreferencesController
  def update
    authorize current_user

    current_user.assign_attributes(profile_params)
    if current_user.save
      redirect_to my_profile_path
    else
      render :edit
    end
  end
end
