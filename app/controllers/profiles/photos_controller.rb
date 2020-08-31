class Profiles::PhotosController < Profiles::PreferencesController
  def update
    authorize current_user
    current_user.assign_attributes(profile_params)
    if current_user.save
      redirect_to edit_profiles_relationship_types_path
    else
      flash[:alert] = form.errors.full_messages.join(", ")
      render :edit
    end
  end
end
