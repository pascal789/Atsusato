class Public::BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = book.id
    if @book_comment.save
      redirect_to public_book_path(book)
    else
      render public_book_path(book)
    end
  end

  def destroy
    @book_comment = BookComment.find(params[:book_id])
    @book_comment.destroy
    redirect_to public_book_path
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
