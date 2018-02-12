class SelectionsController < ItemsController

  def create
    @item = Item.find(params[:item_id])
    @order = Order.create
    #create new association for this item
    Selection.create(item_id: @item.id, order_id: @order.id)

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @item = Item.find(params[:item_id])
    Selection.find_by(id: params[:id], item_id: @item.id).destroy

    redirect_back(fallback_location: root_path)
  end
end
