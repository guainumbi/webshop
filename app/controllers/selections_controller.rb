class SelectionsController < ItemsController
  @item = Item.find_by(id: :item_id)

  def index
    render items_path
  end

  def create
    if @item.selected
      @item.update(selected: false, selected_at: Time.zone.now)
      SelectedItem.find_by(item_id: @item.id).destroy
    else
      @item.update(selected: true, selected_at: Time.zone.now)
      @order = Order.create
      #create new association for this item
      SelectedItem.create(item_id: @item.id, order_id: @order.id)
    end
    redirect_to items_path
  end

  def update
  end
end
