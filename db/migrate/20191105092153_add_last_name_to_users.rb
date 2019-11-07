class AddLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name_ruby, :string
    add_column :users, :first_name_ruby, :string
    add_column :users, :nick_name, :string
    add_column :users, :user_icon_id, :string
    add_column :users, :user_location, :string
    add_column :users, :user_detailed_location, :string
    add_column :users, :user_introduction, :string
    add_column :users, :user_detailed_introduction, :string
    add_column :users, :user_stance, :string
    add_column :users, :deleted_at, :datetime
  end
end
