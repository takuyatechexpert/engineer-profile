class UsersController < ApplicationController

  def edit
  end

  def show
    # @user = User.new
    # 動いたけど要注意
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  # def search
  #   @users = User.search(params[:keyword])
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
