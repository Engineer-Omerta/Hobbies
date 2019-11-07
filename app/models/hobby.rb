class Hobby < ApplicationRecord
	attachment :hobby_image
	belongs_to :category

	def thumbnail
		#return self.hobby_image.variant(resize: '300x300')
	end
end
