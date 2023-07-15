class UsersController < ApplicationController
  
  def create
    @user = User.find(params[:id])
    if @user.save
      redirect_to user_path, notice: 'Welcome! You have signed up successfully'
    else
      render :new
    end
  end
  
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]=""
    @user.update(user_params)
    redirect_to user_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
