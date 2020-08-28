class Profiles::ModeRankingsController < Profiles::PreferencesController
   def update
    authorize current_user
    # current_user.assign_attributes(profile_params)
    current_user.assign_attributes(mode_ranking: params[:user][:mode_ranking].split(','))

    if current_user.save
      redirect_to users_path
    else
      render :edit
    end
  end
end
