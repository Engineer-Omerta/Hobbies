class Admin::UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def delete
    user = User.find(params[:id])
    user_hobbies = user.user_hobbies #削除するユーザーのhobbyを取得
    user.update(deleted_at: Time.now)
    user.save
    user_hobbies.destroy_all #削除するユーザーだけのhobby情報を削除
    redirect_to admin_users_path
  end
end
