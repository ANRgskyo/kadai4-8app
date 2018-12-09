class BooksController < ApplicationController

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
  	if book.save
       flash[:success] = "Book was successfully created."
  	   redirect_to book_path(book.id)
    else
       render("books/new")
    end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	if book = Book.find(params[:id])
  	   book.update(book_params)
       flash[:notice] = "Book was successfully update."
  	   redirect_to book_path(book.id)
    else
       render action: :edit
    end
  end

  def destroy
  	if book = Book.find(params[:id])
  	   book.destroy
       flash[:delete] = "Book was successfully destroyed."
       redirect_to books_path
    else
       render action: :index
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
