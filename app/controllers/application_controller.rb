class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_order

private
  def load_order
    if params[:order_id] != nil
      @order = Order.find(params[:order_id])
    end
  end
end
