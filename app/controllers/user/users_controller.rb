class User::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_back fallback_location: request.referrer
  end

  def matches
    @users = current_user.followings && current_user.followers
  end

  def follows
    @users = current_user.followings
  end

  def followers
    @users = current_user.followers
  end

  def mypage
  end

  def unsubscribe
  end

  private
  def user_params
      params.require(:user).permit(:user_icon, :nick_name, :email, :user_location, :user_detailed_location,
                                   :user_stance, :user_introduction, :user_detailed_introduction)
  end
end
