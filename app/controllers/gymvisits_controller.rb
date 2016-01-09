class GymvisitsController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def new
    @gymvisit = @user.gymvisits.new
  end

  def create
    @gymvisit = @user.gymvisits.create(gymvisit_params)
    redirect_to @user
  end

  private

  def gymvisit_params
    params.require(:gymvisit).permit(:date, :calories_burned)
  end

  def set_user
    @user = current_user
  end

end
