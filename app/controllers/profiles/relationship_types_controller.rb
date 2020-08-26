class Profiles::RelationshipTypesController < Profiles::PreferencesController
  def update
    authorize current_user
    current_user.assign_attributes(profile_params)
    if current_user.save
      # update the path below
      redirect_to edit_profiles_element_rankings_path
    else
      render :edit
    end
  end
end
