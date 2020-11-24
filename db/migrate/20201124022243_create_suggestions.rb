class CreateSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :suggestions do |t|
      t.text :content
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
