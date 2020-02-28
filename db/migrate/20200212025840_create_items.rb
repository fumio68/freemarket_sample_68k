class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name,            null: false
      t.references  :user,            foreign_key: true, null: false
      t.integer     :status,          null: false
      t.integer     :price,           null: false
      t.text        :content,         null: false
      t.string      :brand
      t.string      :condition,       null: false
      t.string      :shipping,        null: false
      t.string      :shipping_area,   null: false
      t.string      :days_to_ship,    null: false
      t.string      :shipping_method, null: false
      t.references  :category,        foreign_key: true, null: false
      t.integer     :category_id_1,   null: false
      t.integer     :category_id_2,   null: false
      t.integer     :category_id_3,   null: false
      t.integer     :size_id
      t.timestamps
    end
  end
end
