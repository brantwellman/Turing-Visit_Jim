class Admin::GymvisitsController < Admin::BaseController

  def edit
    @gymvisit = Gymvisit.find(params[:id])
    @user = @gymvisit.user
  end

  def update
    @gymvisit = Gymvisit.find(params[:id])
    @gymvisit.update(gymvisit_params)
    redirect_to admin_user_path(@gymvisit.user)
  end

  def destroy
    @gymvisit = Gymvisit.find(params[:id])
    @gymvisit.destroy
    redirect_to admin_user_path(@gymvisit.user)
  end

  private

  def gymvisit_params
    params.require(:gymvisit).permit(:date, :calories_burned)
  end

end
