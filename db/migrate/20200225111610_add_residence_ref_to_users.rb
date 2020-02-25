class AddResidenceRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :residence, foreign_key: true
  end
end
