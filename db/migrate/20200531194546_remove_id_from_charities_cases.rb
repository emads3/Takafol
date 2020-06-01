class RemoveIdFromCharitiesCases < ActiveRecord::Migration[6.0]
  def change
    remove_column :charities_cases, :id
  end
end
