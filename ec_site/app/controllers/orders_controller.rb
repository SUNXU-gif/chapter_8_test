class OrdersController < ApplicationController
  before_action :require_login

  def new
    @cart = current_cart
    @line_items = @cart.line_items.includes(:book)
    @order = Order.new
  end

  def confirm
    @cart = current_cart
    @line_items = @cart.line_items.includes(:book)
    @address = params[:delivery_address]
    @total = @line_items.sum { |i| i.price * i.quantity }
    render :confirm
  end

  def create
    cart = current_cart
    line_items = cart.line_items.includes(:book)
    total = line_items.sum { |i| i.price * i.quantity }
    order = Order.create!(user: current_user, quantity: line_items.sum(&:quantity), total: total, delivery_address: params[:delivery_address])
    line_items.each do |i|
      OrderDetail.create!(order: order, book: i.book, count: i.quantity, price: i.price)
    end
    cart.line_items.destroy_all
    redirect_to complete_order_path(order)
  end

  def complete
    @order = Order.find(params[:id])
  end

  private

  def require_login
    redirect_to users_sign_in_path unless user_signed_in?
  end
end
