class Hobby < ApplicationRecord
	belongs_to :user, optional: true #Rail5からbelongs_toのデフォルトが関連先の値を検査するようになった。
									 #Rails4と同様に関連先を検査しないようにするには、belongs_toにoptional: trueを付与すれば良い。
	belongs_to :category
	has_many :user_hobbies
	attachment :hobby_image
	def favorited_by?(user) #メソッドを定義しているだけなのでこの名前でいい。
          user_hobbies.where(user_id: user.id).exists?
    end
    def self.search(search) #selfとつけることでsearchはクラスメソッドとなる
    	#クラスメソッドはmodelクラスのレコードを検索するなどの用途や作成されたインスタンスの数を数えるなど、
    	#個々のインスタンスには紐付けずクラスに対して働きかけるメソッド
    	#selfと記述する事によってsearchは紐付いているhobbyのみを探すという意味？？
		if search
			Hobby.where(['hobby_name LIKE ?', "%#{search}%"]) #searchが実行されたら入力されたワードと同じhobby_nameを探す
		else
			Hobby.all
		end
	end
end
