class FollowersController < ApplicationController
  def index
    # @relationships = Relationship.all
    # @users = User.all
    # @users = User.find(current_user.id)
    @users = User.find(current_user.id)
  end
end