class CreateCharitiesCases < ActiveRecord::Migration[6.0]
  def change
    create_table :charity_cases do |t|
      t.string :state
      t.timestamps
    end
  end
end
