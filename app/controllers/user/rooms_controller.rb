class User::RoomsController < ApplicationController
  before_action :authenticate #application_controllerで定義済み　ログインしていなければhome/topへ飛ばす
  def show
  	@room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
      #ユーザーの名前などの情報を表示させるために、@room.entriesを@entriesというインスタンス変数に入れ、Entriesテーブルのuser_idの情報を取得します（ビューの方で記述
      @entries.each do |entry| #相手ユーザーを変数に入れる記述　まず自分と相手、二人のユーザーを取り出す
        if entry.user != current_user #!=とは右辺と左辺が等しくないとき　自分ではない方のユーザーを特定
        @partner = entry.user #特定した相手ユーザーを変数へ入れる
        end
      end
    else
      redirect_back(fallback_location: root_path)
    end
    render layout: false #application.html.erbを適用したくない時に使う
  end

  def create #users/show.html.erbのform_forの@roomで送られてきたパラメータを、ここで受け取りcreateする
  	@room = Room.create
  	#Room以外にその子モデルのEntryもcreateさせなければいけないので、Entriesテーブルに入る相互フォロー同士のユーザーを保存させるための記述を下記で行う
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    #current_userに対しては、@entry1とし、EntriesテーブルにRoom.createで作成された@roomにひもづくidと、current_userのidを保存させる記述する
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    #users/show.html.erbのfields_for @entryで保存したparamsの情報(:user_id, :room_id)を許可し、current_userと同じく@roomにひもづくidを保存する記述
    redirect_to user_room_path(@room.id)
  end
end
