class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create

  end


  private

  def post_params
    params.require(:post).permit(:title, :comment, :image, :url).marge(user_id: current_user.id)
  end

end
