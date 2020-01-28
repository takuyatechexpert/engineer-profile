class FollowersController < ApplicationController
  def index
    @users = User.find(current_user.id)
  end
end