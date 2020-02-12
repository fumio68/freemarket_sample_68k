class AddPropertiesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :family_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :j_family_name, :string, null: false
    add_column :users, :j_last_name, :string, null: false
    add_column :users, :b_year, :integer, null: false
    add_column :users, :b_month, :integer, null: false
    add_column :users, :b_date, :integer, null: false
    add_column :users, :user_image, :string
  end
end
