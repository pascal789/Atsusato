class Admin::BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  def show
    @book = Book.find(params[:id])
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to admin_books_path
  end
end
