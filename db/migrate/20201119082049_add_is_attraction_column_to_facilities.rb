class AddIsAttractionColumnToFacilities < ActiveRecord::Migration[6.0]
  def change
    add_column :facilities, :is_attraction, :boolean, default: false
  end
end
