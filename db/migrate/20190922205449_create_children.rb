class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.integer :child_id
      t.references :parent, foreign_key: true

      t.timestamps
    end
  end
end
