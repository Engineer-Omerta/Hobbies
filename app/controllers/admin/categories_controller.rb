class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
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
  end

  def update
  end

  private

    def category_params
        params.require(:category).permit(:category_name, :category_image)
    end
end
