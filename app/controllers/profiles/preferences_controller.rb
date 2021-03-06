class Profiles::PreferencesController < ApplicationController
  def edit
    authorize current_user
  end

  def update
    authorize current_user

    form = PreferencesForm.new(profile_params)
    form.age_preference = []
    form.age_preference << params["user"]["age_preference"].split(',').first.to_i
    form.age_preference << params["user"]["age_preference"].split(',').last.to_i
    current_user.min_age = params["user"]["age_preference"].split(',').first.to_i
     current_user.max_age = params["user"]["age_preference"].split(',').last.to_i
    if form.valid?
      current_user.update(profile_params)
      current_user.age_preference = form.age_preference
      current_user.save
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
      :biography,
      :age_preference,
      activities: [],
      photos: [],
      personality_traits: [])
  end
end
