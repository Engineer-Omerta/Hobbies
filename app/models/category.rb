class Category < ApplicationRecord
	attachment :category_image
	has_many :hobbies, dependent: :destroy

	validates :category_name, presence: :true,
			  length: { maximum: 20 }
	validates :category_image, presence: :true

end
