class StaticPagesController < ApplicationController

  def home
  end

  def control_panel
    if !logged_in?
      flash[:error] = "Nice try, but no."
      redirect_back(fallback_location: root_path)
    end
  end
end
