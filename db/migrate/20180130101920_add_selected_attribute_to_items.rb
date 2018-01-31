class AddSelectedAttributeToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :selected, :boolean
    add_column :items, :selected_at, :datetime
  end
end
