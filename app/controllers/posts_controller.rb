class PostsController < ApplicationController
  before_action :find_board

  def show
    @post = Post.find(params[:id])
  end

  def create
    if params[:commit] == "reply"
      @post = Post.find(params[:id])
      @reply = @board.posts.new post_params
      @reply.thread = @post
      @reply.ip = request.remote_ip
      if @reply.save
        @post.bumped_at = Time.now
        @post.save
        redirect_to post_path(@board, @post)
      else
        redirect_to request.referer, notice: "Well, something went wrong"
      end
    else
      @post = @board.posts.new post_params
      @post.thread = @post
      @post.ip = request.remote_ip
      @post.bumped_at = Time.now
      if @post.save
        redirect_to @board
      else
        redirect_to request.referer, notice: "Well, something went wrong"
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def find_board
    @board = Board.find(params[:board_id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :picture)
  end
end
