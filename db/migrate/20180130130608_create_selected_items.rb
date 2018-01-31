class CreateSelectedItems < ActiveRecord::Migration[5.1]
  def change
    create_table :selected_items do |t|
      t.integer :item_id
      t.integer :order_id

      t.timestamps
    end
  end
end
