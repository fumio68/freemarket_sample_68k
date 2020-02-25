class DeleteItemimagesRefToItems < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :items, :item_images
    remove_reference :items, :item_image, index: true
  end
end
