class Hobby < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :user_hobbies
	attachment :hobby_image
	def favorited_by?(user) #メソッドを定義しているだけなのでこの名前でいい。
          user_hobbies.where(user_id: user.id).exists?
    end
end
