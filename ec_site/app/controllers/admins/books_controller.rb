class Admins::BooksController < ApplicationController

  def require_admin
    redirect_to admins_sign_in_path unless admin_signed_in?
  end


  def index
    @books = Book.order(id: :asc)
  end

  def new
    @book = Book.new
    @tags = Tag.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      attach_image
      assign_tags
      redirect_to admins_book_path(@book)
    else
      @tags = Tag.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @tags = Tag.all
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      attach_image
      assign_tags
      redirect_to admins_book_path(@book)
    else
      @tags = Tag.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to admins_books_path
  end

  private

  def require_admin
    redirect_to admins_sign_in_path unless admin_signed_in?
  end

  def book_params
    params.require(:book).permit(:book_name, :author_name, :issue_date, :product_display, :price, :status)
  end

  def attach_image
    if params[:book][:image].present?
      @book.image.attach(params[:book][:image])
    end
  end

  def assign_tags
    ids = Array(params[:book][:tag_ids]).reject(&:blank?)
    @book.taggings.destroy_all
    ids.each { |tid| @book.taggings.create(tag_id: tid) }
  end
end
