class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @gymvisits = @user.gymvisits
  end

end
