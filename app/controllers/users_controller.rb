class UsersController < ApplicationController

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id), notice: 'profileを更新しました'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :name, :age, :occupation, :experience, :sns, :image, :programming_lang, :pr)
  end

end

