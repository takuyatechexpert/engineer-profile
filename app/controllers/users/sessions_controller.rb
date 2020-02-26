# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def new_guest
    user = User.find(3)
    user.update(name: 'ゲストユーザー', email: 'guestuser@example.com', age: '100',
                occupation: 'フリーランス', experience: '100',sns: 'guestSNS',
                programming_lang: '# markdown記法が使えます',
                pr: '# 訪問ありがとうございます!!
このサイトはエンジニアがエンジニアを探し、
エンジニアとエンジニアを繋ぐエンジニアの為のサイトです  
___
# ☆サイトの特徴
・user検索で名前、キーワードによる複数条件検索機能
・フォロー機能
・Programmnig lang、PRでmarkdown記法が使用可能')
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
