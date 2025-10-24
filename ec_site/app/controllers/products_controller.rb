class ProductsController < ApplicationController
  before_action :require_login

  def index
    @keyword = params[:keyword].to_s
    @tag_id = params[:tag_id].presence
    scope = Book.where(product_display: true)
    scope = scope.where("book_name LIKE ?", "%#{@keyword}%") if @keyword.present?
    if @tag_id.present?
      scope = scope.joins(:taggings).where(taggings: { tag_id: @tag_id })
    end
    @books = scope.order(:id)
    @tags = Tag.order(:id)
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def require_login
    redirect_to users_sign_in_path unless user_signed_in?
  end
end
