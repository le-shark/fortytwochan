class PostsController < ApplicationController
  before_action :find_board

  def create
    @post = @board.posts.new post_params
    @post.thread = @post
    @post.ip = request.remote_ip
    if @post.save
      redirect_to @board
    else
      redirect_to request.referer, notice: "Well, something went wrong"
    end
  end

  private
  def find_board
    @board = Board.find(params[:board_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
