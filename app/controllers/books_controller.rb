class BooksController < ApplicationController
  def index
    @books = Book.order(:title)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new()
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "Book created."
    else
      redirect_to books_path, notice: "Error creating book."
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path, notice: "Book updated."
    else
      redirect_to books_path, notice: "Error updating book."
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Book deleted."
  end
   
  private

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :price,
      :published_date
    )
  end
end
