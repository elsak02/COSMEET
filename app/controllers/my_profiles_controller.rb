require 'yaml'

class MyProfilesController < ApplicationController
  def show
    authorize current_user
  end

  def chart
    authorize current_user
  end

  def edit
    authorize current_user
  end

  def update
    authorize current_user
    birthdate = current_user.birth_date
    birthplace = current_user.birth_place
    birthtime = current_user.birth_time
    current_user.assign_attributes(strong_params)
    if current_user.save
      if (birthdate == current_user.birth_date) && (birthplace == current_user.birth_place) && (birthtime == current_user.birth_time)
        redirect_to my_profile_path
      else
        current_user.chart_elements.destroy_all
        PopulateChartElementJob.perform_now(current_user)
        redirect_to my_profile_path
      end
    else
      render :edit
    end
  end

  private

  def strong_params
    params.require(:user).permit(
      :name,
      :biography,
      :birth_date,
      :birth_place,
      :birth_time,
      :gender,
      :sexual_preference,
      :relationship_type,
      :mode_ranking,
      :element_ranking,
      :age_preference,
      activities: [],
      photos: [],
      personality_traits: [])
  end
end
