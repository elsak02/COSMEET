class Profiles::BirthInfosController < Profiles::PreferencesController

  def update
    authorize current_user
    current_user.assign_attributes(profile_params)
    if current_user.save
      # changer ceci avec la prochaine etape!
      redirect_to root_path
    else
      render :edit
    end
  end

end
