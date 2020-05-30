class CreateCaseDoners < ActiveRecord::Migration[6.0]
  def change
    create_table :case_doners do |t|
      t.string :state
      t.timestamps
    end
  end
end
