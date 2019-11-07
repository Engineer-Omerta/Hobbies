class Category < ApplicationRecord
	attachment :category_image
	has_many :hobbies, dependent: :destroy
end
