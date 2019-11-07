class CreateHobbies < ActiveRecord::Migration[5.2]
  def change
    create_table :hobbies do |t|
      t.integer :category_id
      t.string :hobby_name
      t.string :hobby_image_id

      t.timestamps
    end
  end
end
