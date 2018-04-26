class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_order

private
  def load_order
    if session[:order_id] != nil
      @order = Order.find(session[:order_id])
    end
      @order ||= Order.new
  end
end
