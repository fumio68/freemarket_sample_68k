class ModifyItemsProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :category_id_1, :integer, null: false
    add_column :items, :category_id_2, :integer, null: false
    add_column :items, :category_id_3, :integer, null: false
    add_column :items, :size_id, :integer, null: false
    remove_column :items, :shipping, :integer
    add_column :items, :shipping, :string, null: false
    add_reference :items, :category, foreign_key: true
  end
end
