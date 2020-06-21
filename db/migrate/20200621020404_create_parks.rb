class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :address
      t.string :opening_hours
      t.text :description
      t.string :facilities
      t.string :attractions
      t.string :best_season

      t.timestamps
    end
  end
end
