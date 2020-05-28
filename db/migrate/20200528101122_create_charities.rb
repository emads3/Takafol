class CreateCharities < ActiveRecord::Migration[6.0]
  def change
    create_table :charities do |t|
      t.string :name
      t.string :email,null: false
      t.string :encrypted_password, null: false
      t.text :address
      t.string :phone_number
      t.text :description,null: true
      t.timestamps
    end
  end
end
