class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.string :family_name, null: false
      t.string :last_name, null: false
      t.string :j_family_name, null: false
      t.string :j_last_name, null: false
      t.string :postcode, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.string :phone_number
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
