class Admin::BooksController < ApplicationController
  def index
    @books = Book.page(params[:page])
    @book = Book.new
  end
  def show
    @book = Book.find(params[:id])
    @book_comments = @book.book_comments
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to admin_books_path
  end
end
