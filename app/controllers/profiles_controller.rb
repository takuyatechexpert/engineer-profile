class ProfilesController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).order("created_at DESC")
    # werer.notでログインしているユーザーを除いている
    @keyword = params[:keyword]

    if @keyword.present?
      @users = User.where.not(id: current_user.id).order("created_at DESC")
      @keyword = params[:keyword].split(/[[:blank:]]+/)
      
      @keyword.each do |search|
        next if search == ""
        # 先頭のスペースをスキップする記述
        @users = @users.where('name LIKE(?) OR age LIKE(?) OR occupation LIKE(?) OR experience LIKE(?) OR programming_lang LIKE(?) OR pr LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
        end
    else
      @users = User.where.not(id: current_user.id).order("created_at DESC")

      respond_to do |format|
        format.html
        format.json
      end
    end
  end

end