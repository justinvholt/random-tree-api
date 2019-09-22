class AddColumnToChildren < ActiveRecord::Migration[5.2]
  def change
    add_reference :children, :table, foreign_key: true
  end
end
