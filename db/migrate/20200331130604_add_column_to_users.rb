class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_name, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :profile, :text
    add_column :users, :image, :text
  end
end
