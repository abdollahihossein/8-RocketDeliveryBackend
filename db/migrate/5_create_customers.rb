class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.integer :user_id,               null: false, unique: true
      t.integer :address_id,            null: false
      t.string :phone                   null: false
      t.string :email   
      t.boolean :active                 null: false, default: true

      t.timestamps
    end
    add_foreign_key :customers, :users, column: :user_id, primary_key: "id"
    add_foreign_key :customers, :addresses, column: :address_id, primary_key: "id"
  end
end
