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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_post_path
    end
  end

  def destroy
    if Post.destroy(params[:id])
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :comment, :image, :url).merge(user_id: current_user.id)
  end

end
