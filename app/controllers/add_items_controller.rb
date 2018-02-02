class AddItemsController < ApplicationController
  def index
    @item = Item.new
  end
end
