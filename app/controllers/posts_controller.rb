class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_path(current_user)
    else
      render new_post_path
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :comment, :image, :url).merge(user_id: current_user.id)
  end

end
