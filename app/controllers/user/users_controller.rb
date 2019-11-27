class User::UsersController < ApplicationController
  before_action :authenticate #application_controllerで定義済み　ログインしていなければhome/topへ飛ばす
  before_action :correct_user, only: [:edit, :update, :follows, :followers, :unsubscribe, :delete]

  def show
    @user = User.find(params[:id])
    #DM機能
    #Entryモデル内にcurrent_userと今のshowページのユーザーのIDがあるかを確認する記述
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)

    #既にroomが作られているのか、作られていないのかを条件分岐させる
    unless @user.id == current_user.id #ユーザーが自分の時は以下を出さない様にする
      @currentUserEntry.each do |cu| #current_userのEntryを全て取り出す
        @userEntry.each do |u| #@userのEntryを全て取り出す
          if cu.room_id == u.room_id then #取り出した互いのEntryのroom_idが共通していれば下記を実行する (thenとは条件式がtrueなら下記を実行するという意味)
            @isRoom = true #roomがない場合は、これがfalseとなる。falseならばRoomを作成する つまりRoomを作成する為に必要な記述
            @roomId = cu.room_id #互いのroom_idが共通していればroom_idにそのidを入れてやる
          end
        end
      end
      unless @isRoom #@isRoomがfalseの時は下記を実行する
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_users_mypage_path
  end

  def matches
    @users = current_user.followings & current_user.followers
    #ここは&&では駄目。&である必要がある。配列式なので&&は使えない。使えるが効果が違うため。　"かつ"という意味で&&が使えるのはif文のような条件式のみ
    
  end

  def follows
    @users = current_user.followings
  end

  def followers
    @users = current_user.followers
  end

  def mypage
    @user = current_user
  end

  def unsubscribe
  end

  def delete
    user = User.find(params[:id])
    user_hobbies = user.user_hobbies #削除するユーザーのhobbyを取得
    user.update(deleted_at: Time.now)
    user.save
    user_hobbies.destroy_all #削除するユーザーだけのhobby情報を削除
    redirect_to root_path
  end

  private
  def user_params
      params.require(:user).permit(:user_icon, :nick_name, :email, :user_location, :user_detailed_location,
                                   :user_stance, :user_introduction, :user_detailed_introduction)
  end
  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
       redirect_to user_home_top_path
    end
  end
end
