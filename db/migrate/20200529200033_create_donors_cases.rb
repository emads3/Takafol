class CreateDonorsCases < ActiveRecord::Migration[6.0]
  def change
    create_table :donors_cases do |t|
      t.string :state
      t.timestamps
    end
  end
end
