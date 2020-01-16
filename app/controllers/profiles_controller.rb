class ProfilesController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
    # werer.notでログインしているユーザーを除いている
  end
end
