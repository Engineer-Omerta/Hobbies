class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @hobbies = Hobby.where(category_id: @category.id)
  end

  def new
    @category = Category.new
  end

  def create
    # ストロングパラメーターを使用 refileを使って画像をカラムに保存する場合、カラム名の末尾に_idをつけること！！
    category = Category.new(category_params)
    # DBへ保存する
    category.save
    #リダイレクト
    redirect_to new_admin_category_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to edit_admin_category_path(@category)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end

  private

    def category_params
        params.require(:category).permit(:category_name, :category_image)
    end
end
