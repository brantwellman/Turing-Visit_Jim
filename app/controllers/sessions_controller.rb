class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.admin?
        redirect_to admin_users_path
      else
        redirect_to @user
      end
    else
      flash[:error] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
