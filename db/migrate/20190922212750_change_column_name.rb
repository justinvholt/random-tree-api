class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    change_column :tables, :tree, :blob
  end
end
