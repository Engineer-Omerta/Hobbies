class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.string :category_image_id

      t.timestamps
    end
  end
end
