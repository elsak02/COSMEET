class Profiles::BirthInfosController < Profiles::PreferencesController
  def update
    authorize current_user

    form = BirthInfosForm.new(format_params)
    if form.valid?
      current_user.update(profile_params)
      PopulateChartElementJob.perform_now(current_user)
      # raise
      redirect_to edit_profiles_photos_path
    else
      flash[:alert] = form.errors.full_messages.join(", ")
      render :edit
    end
  end

  def index
  end

  private

  def format_params
    data = params.require(:user)
    birth_date = "#{data['birth_date(1i)']}-#{data['birth_date(2i)']}-#{data['birth_date(3i)']}"

    birth_time = "#{data['birth_time(1i)']}-#{data['birth_time(2i)']}-#{data['birth_time(3i)']}-#{data['birth_time4i)']}-#{data['birth_time(5i)']}"

    birth_place = "#{data['birth_place']}"
    { birth_place: birth_place, birth_time: birth_time, birth_date: birth_date  }
  end
end
