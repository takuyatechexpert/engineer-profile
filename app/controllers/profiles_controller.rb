class ProfilesController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).order("created_at DESC")
    # werer.notでログインしているユーザーを除いている
  end

  def search

    redirect_to root_path if params[:keyword] == ""
    keywords = params[:keyword].split(/[[:blank:]]+/)
    @users = []
    keywords.each do |search|
    next if search == ""
    @users += User.where('name LIKE(?) OR age LIKE(?) OR occupation LIKE(?) OR experience LIKE(?) OR programming_lang LIKE(?) OR pr LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").where.not(id: current_user.id).order("created_at DESC")
    end
    @users.uniq!
    # @users = User.search(params[:keyword]).where.not(id: current_user.id).order("created_at DESC")

    # return User.all unless search
    # keywords = search.split(/[[:blank:]]+/)
    # # @users = []
    # keywords.each do |search|
    # next search == ""
    # User.where('name LIKE(?) OR age LIKE(?) OR occupation LIKE(?) OR experience LIKE(?) OR programming_lang LIKE(?) OR pr LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    # end

  end

end