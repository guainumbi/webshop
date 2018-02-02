class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      flash[:success] = "Item has been added to store!"
      redirect_to items_path
    else
      flash[:danger] = "Something went wrong! Your item has not been saved."
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :currency)
  end
end
