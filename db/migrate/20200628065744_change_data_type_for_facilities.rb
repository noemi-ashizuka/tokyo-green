class ChangeDataTypeForFacilities < ActiveRecord::Migration[6.0]
  def self.up
    change_table :parks do |t|
      t.change :facilities, :string
    end
  end

  def self.down
    change_table :parks do |t|
      t.change :facilities, array: true
    end
  end

end
