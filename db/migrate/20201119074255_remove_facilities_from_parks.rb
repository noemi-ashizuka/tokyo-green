class RemoveFacilitiesFromParks < ActiveRecord::Migration[6.0]
  def change
    remove_column :parks, :facilities
  end
end
