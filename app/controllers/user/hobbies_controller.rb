class User::HobbiesController < ApplicationController
  before_action :authenticate #application_controllerで定義済み　ログインしていなければhome/topへ飛ばす
  def index

  end

  def new
    @hobby = Hobby.new
  end

  def create
    # ストロングパラメーターを使用 refileを使って画像をカラムに保存する場合、カラム名の末尾に_idをつけること！！
    @hobby = Hobby.new(hobby_params)
    # DBへ保存する
    if @hobby.save
      flash[:notice] = "Hobbyが作成されました。"
      redirect_to user_hobby_path(@hobby.id)
      #バリデーションで条件分岐　リダイレクト
    else
      render :new
    end

    #バリデーションなしの時の記述↓
    # def create
    # # ストロングパラメーターを使用 refileを使って画像をカラムに保存する場合、カラム名の末尾に_idをつけること！！
    # hobby = Hobby.new(hobby_params)
    # # DBへ保存する
    # hobby.save!
    # #リダイレクト
    # redirect_to user_hobby_path(hobby.id)
    # end

  end

  def show
    @hobby = Hobby.find(params[:id])
    @user_hobbies = UserHobby.where(hobby_id: @hobby.id)
  end

  def main_hobby
  end

  def main_hobby_create
  end

  def main_hobby_update
  end

  def search
    @hobbies = Hobby.search(params[:search])
    #Viewのformでユーザーが入力したパラメータをモデルに渡す
  end

  private

    def hobby_params
      params.require(:hobby).permit(:hobby_name, :hobby_image, :category_id)
    end
end
