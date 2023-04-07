class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.integer :user_id,                           null: false
      t.integer :address_id,                        null: false, unique: true
      t.string :phone,                              null: false
      t.string :email               
      t.string :name,                               null: false
      t.integer :price_range,                       null: false, default: 1, min: 1, max: 3
      t.boolean :active,                            null: false, default: true

      t.timestamps
    end
    add_foreign_key :restaurants, :users, column: :user_id, primary_key: "id"
    add_foreign_key :restaurants, :addresses, column: :address_id, primary_key: "id"
  end
end
