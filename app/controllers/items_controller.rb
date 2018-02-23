class ItemsController < ApplicationController
  require 'pry'
  def index
    @items = Item.all
    @selections = Selection.all
    @orders = Order.all
    # binding.pry
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

  def destroy
    Item.find(params[:id]).destroy
    flash[:success] = "Item deleted"
    redirect_to items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :currency)
  end
end
