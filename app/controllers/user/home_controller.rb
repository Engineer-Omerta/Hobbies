class User::HomeController < ApplicationController
  def top
    render layout: false #application.html.erbを適用したくない時に使う
  end

  def index
    @user = User.find(current_user.id) #userにcurrent_userの情報を入れる
    @current_user_hobbies = @user.hobbies #userにcurrent_userの情報を入れる
    @randam_current_user_hobbies = @current_user_hobbies.find(@current_user_hobbies.pluck(:id).shuffle[0..4])
    #pluckで@current_user_hobbiesのid、つまりcurrent_userの持つhobbyのIDを全て取り出す。そのidをシャッフルし、0番目から4番目まで5つ分を変数へ代入
  end

  def hobby
  end

  def location
  end
end
