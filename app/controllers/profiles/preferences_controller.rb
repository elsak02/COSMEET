class Profiles::PreferencesController < ApplicationController
  def edit
    authorize current_user
  end

  def update
    authorize current_user
    current_user.assign_attributes(profile_params)
    if current_user.save
      # changer ceci avec la prochaine etape!
      redirect_to edit_profiles_birth_infos_path
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(
      :name,
      :birth_date,
      :birth_place,
      :birth_time,
      :gender,
      :sexual_preference,
      :relationship_type,
      :element_ranking,
      :mode_ranking)
  end
end
