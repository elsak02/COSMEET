class Profiles::ActivitiesController < Profiles::PreferencesController
  def update
    authorize current_user
    # # form = ActivitiesForm.new(profile_params)
    # # form.user = current_user
    # # if form.valid?
    # #   form.save
    # #   redirect_to my_profile_path
    # else
    #   flash[:alert] = form.errors.full_messages.join(", ")
    #   render :edit
    # end
    current_user.assign_attributes(profile_params)

    if current_user.save
      redirect_to my_profile_path
    else
      render :edit
    end
  end
end
