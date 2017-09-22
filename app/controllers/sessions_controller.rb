class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:info] = "You are already logged in"
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:error] = "Nice attempt, but why don't you try again?"
      render 'new'
    end
  end

  def destroy
    flash[:info] = "See you!"
    log_out if logged_in?
    redirect_back(fallback_location: root_path)
  end
end
