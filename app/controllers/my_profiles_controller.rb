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
    current_user.assign_attributes(strong_params)
    if current_user.save?
      redirect_to my_profile_path
    else
      render :edit
    end
  end

  private

  def strong_params
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
