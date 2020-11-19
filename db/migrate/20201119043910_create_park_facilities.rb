class CreateParkFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :park_facilities do |t|
      t.references :park, null: false, foreign_key: true
      t.references :facility, null: false, foreign_key: true

      t.timestamps
    end
  end
end
