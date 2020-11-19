class RemoveAttractionsFromPark < ActiveRecord::Migration[6.0]
  def change
    remove_column :parks, :attractions
  end
end
