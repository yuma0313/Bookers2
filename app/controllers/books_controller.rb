class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book)
    else
      @books = Book.all
      render"index"
    end
    flash[:success] = "You have created book successfully."
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @post_comment = PostComment.new
    @post_comments = PostComment.all
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id == current_user.id
      render"edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      @books = Book.all
      render"edit"
    end
    flash[:success] = "You have updated book successfully."
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
