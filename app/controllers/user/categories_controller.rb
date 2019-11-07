class User::CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.find(params[:id])
  	@hobbies = Hobby.where(category_id: @category.id)
  	#@favorite = Favorite.find(params[:id])このparams[:id]はbookのidが入っている状態。
	#今はfavoriteを呼び出したいからfavoriteのidを入れる必要がある
	#favorite.findの検索条件は主キーidのみ。
	#favorite.find_byは(book_id（カラム名またはid）: ○○（検索条件）)のように条件を複数指定して最初の1件のみ呼び出せる
	#favorite.whereは(book_id（カラム名）: ○○（検索条件）)のように条件を複数指定して全て呼び出せる
	#ここならfavoriteモデル内の全てのbook_idカラムの今参照している@bookのidだけのデータ全てが出てくる。
  end
end
