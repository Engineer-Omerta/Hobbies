class Hobby < ApplicationRecord

	belongs_to :category
	has_many :user_hobbies, dependent: :destroy
	delegate :thread, to: :users
	attachment :hobby_image
	def favorited_by?(user) #メソッドを定義しているだけなのでこの名前でいい。
          user_hobbies.where(user_id: user.id).exists?
    end

    def user_hobby_user(user_id)
   		user_hobbies.find_by(user_id: user_id)
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
