class ProfilesController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).order("created_at DESC")
    # werer.notでログインしているユーザーを除いている
  end

  def search
    @users = User.search(params[:keyword]).where.not(id: current_user.id).order("created_at DESC")
  end

end
