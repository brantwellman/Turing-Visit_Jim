class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account created!"
      redirect_to @user
    else
      flash.now[:error] = "Your email or password is incorrect."
      render :new
    end
  end

  def show
    @user = current_user
    @gymvisits = @user.gymvisits
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
