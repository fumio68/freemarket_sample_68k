class AddItemimagesRefToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :item_image, foreign_key: true
  end
end
