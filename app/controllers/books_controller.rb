class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to books_path
    else
      render :show
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @books = @user.books
    @new_book = Book.new
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice]="Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice]="Book was successfully destroyed."
      redirect_to books_path
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
