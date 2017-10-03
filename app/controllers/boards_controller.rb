class BoardsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    @board = Board.find(params[:id])
    @posts = @board.posts.order(bumped_at: :asc)
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:info] = "Board created"
      redirect_to control_panel_path
    else
      flash[:info] = "Something went wrong"
      redirect_to control_panel_path
    end
  end

  private

  def record_not_found
    flash[:error] = "Board not found. Try something else."
    redirect_back(fallback_location: root_path)
  end

  def board_params
    params.require(:board).permit(:name, :title)
  end
end
