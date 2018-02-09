class SelectionsController < ItemsController

  def index
    render items_path
  end

  def create
    @item = Item.find(params[:item_id])
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