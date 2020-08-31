class Profiles::PreferencesController < ApplicationController
  def edit
    authorize current_user
  end

  def update
    authorize current_user
    form = PreferencesForm.new(profile_params)
    if form.valid?
      current_user.update(profile_params)
      redirect_to edit_profiles_birth_infos_path
    else
      flash[:alert] = form.errors.full_messages.join(", ")
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
      :mode_ranking,
      :element_ranking,
      photos: [],
      personality_traits: [])
  end
end
