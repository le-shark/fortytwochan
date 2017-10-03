class ModerationController < ApplicationController
  def remove_posts
    Post.where(ip: params[:remove_posts][:ip]).each do |p|
      p.delete
    end
    flash[:info] = "Posts removed"
    redirect_to control_panel_path
  end

  def new_user
    @user = User.new(user_params)
    if @user.save
      flash[:info] = "Moderator saved"
      redirect_to control_panel_path
    else
      flash[:info] = "Try again"
      redirect_to control_panel_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
