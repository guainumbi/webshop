class RemoveSelectedFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :selected
    remove_column :items, :selected_at
  end
end
