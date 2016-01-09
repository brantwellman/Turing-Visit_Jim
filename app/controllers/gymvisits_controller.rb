class GymvisitsController < ApplicationController
  before_action :set_user, only: [:new, :create, :edit, :update]

  def new
    @gymvisit = @user.gymvisits.new
  end

  def create
    @gymvisit = @user.gymvisits.create(gymvisit_params)
    redirect_to @user
  end

  def edit
    @gymvisit = @user.gymvisits.find(params[:id])
  end

  def update
    @gymvisit = Gymvisit.find(params[:id])
    @gymvisit.update_attributes(gymvisit_params)
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
