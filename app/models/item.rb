class Item < ApplicationRecord
  has_many :selected_items
  has_many :orders, through: :selected_items

  def select
    update_columns(selected: true, selected_at: Time.zone.now)
    @order = Order.create
    #create new association for this item
    SelectedItem.create(item_id: self.id, order_id: @order.id)
  end

  def unselect
    update_columns(selected: false, selected_at: Time.zone.now)
    SelectedItem.find_by(item_id: self.id).destroy
  end
end
