class Profiles::RelationshipTypesController < Profiles::PreferencesController
  def update
    authorize current_user
    form = RelationshipTypesForm.new(profile_params)
    if form.valid?
      current_user.update(profile_params)
      redirect_to edit_profiles_element_rankings_path
    else
      flash[:alert] = form.errors.full_messages.join(", ")
      render :edit
    end
  end
end
