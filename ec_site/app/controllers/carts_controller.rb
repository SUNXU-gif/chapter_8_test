class CartsController < ApplicationController
  before_action :require_login

  def show
    @cart = current_cart
    @line_items = @cart.line_items.includes(:book)
  end

  def destroy
    current_cart.line_items.destroy_all
    redirect_to products_path, notice: "カートが空になりました"
  end

  def add_item
    book = Book.find(params[:book_id])
    qty = params[:quantity].to_i
    item = current_cart.line_items.find_or_initialize_by(book_id: book.id)
    item.quantity = item.quantity.to_i + qty
    item.price = book.price
    item.save
    redirect_to cart_path
  end

  def remove_item
    item = current_cart.line_items.find_by(id: params[:line_item_id])
    item&.destroy
    redirect_to cart_path
  end

  private

  def require_login
    redirect_to users_sign_in_path unless user_signed_in?
  end
end
