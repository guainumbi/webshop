class RenameSelectedItemsToSelections < ActiveRecord::Migration[5.1]
  def change
    rename_table :selected_items, :selections
  end
end
