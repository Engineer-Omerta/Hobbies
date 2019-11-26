class Admin::HobbiesController < ApplicationController
  before_action :authenticate_admin!
  def show
  	@hobby = Hobby.find(params[:id])
    @user_hobbies = UserHobby.where(hobby_id: @hobby.id)
  end

  def edit
  	@hobby = Hobby.find(params[:id])
  end

  def update
  	@hobby = Hobby.find(params[:id])
    @hobby.update(hobby_params)
    redirect_to edit_admin_hobby_path(@hobby)
  end

  def destroy
    @hobby = Hobby.find(params[:id])
    @hobby.destroy
    redirect_to admin_categories_path
  end

  def search
    @hobbies = Hobby.search(params[:search])
    #Viewのformでユーザーが入力したパラメータをモデルに渡す
  end

  private
    def hobby_params
        params.require(:hobby).permit(:hobby_name, :hobby_image)
    end
end
