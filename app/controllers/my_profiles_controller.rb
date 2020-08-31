require 'yaml'

class MyProfilesController < ApplicationController
  def show
    authorize current_user
  end

  def chart
    authorize current_user
  end

  def edit
  end

  def update
  end
end
