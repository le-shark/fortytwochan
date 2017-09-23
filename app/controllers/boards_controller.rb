class BoardsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    @board = Board.find(params[:id])
    @posts = @board.posts
  end

  private

  def record_not_found
    flash[:error] = "Board not found. Try something else."
    redirect_back(fallback_location: root_path)
  end
end
