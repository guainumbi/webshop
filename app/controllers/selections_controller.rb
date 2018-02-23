class SelectionsController < ItemsController
  require 'pry'
  before_action :load_item

  def create
    @order ||= Order.create
    # @order = Order.last
    #create new association for this item
    Selection.create(item_id: @item.id, order_id: @order.id)
    redirect_back(fallback_location: root_path, order_id: @order.id)
  end

  def destroy
    Selection.find_by(id: params[:id], item_id: @item.id).destroy

    redirect_back(fallback_location: root_path)
  end

  def destroy_all_for_item
    @item.selections.destroy_all #will have to be matched to an order_id in the future

    redirect_back(fallback_location: root_path)
  end

  private

    def load_item
      @item = Item.find(params[:item_id])
    end
end
