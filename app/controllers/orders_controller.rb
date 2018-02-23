class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @selections = Selection.all
  end
end
