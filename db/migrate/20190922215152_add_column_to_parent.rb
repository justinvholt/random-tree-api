class AddColumnToParent < ActiveRecord::Migration[5.2]
  def change
    add_reference :parents, :table, foreign_key: true
  end
end
