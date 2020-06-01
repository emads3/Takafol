class RemoveIdFromDonorsCases < ActiveRecord::Migration[6.0]
  def change
    remove_column :donors_cases, :id

  end
end
