class RenameOrderToDisplayOrder < ActiveRecord::Migration[5.1]
  def change
    rename_column :statuses, :order, :display_order
  end
end
