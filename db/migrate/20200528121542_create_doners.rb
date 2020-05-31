class CreateDoners < ActiveRecord::Migration[6.0]
  def change
    create_table :doners do |t|
      t.string :name
      t.string :email,null: false
      t.string :encrypted_password, null: false
      t.integer :national_id, null: false
      t.string :national_id_img
      t.text :address
    
      t.timestamps
    end
  end
end
