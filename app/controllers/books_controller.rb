class BooksController < ApplicationController
  
  def create
    @books = Book.all
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to book_path(@book.id)
     flash[:notice] = "successfully"
    else
     render:index
    end
  end
  
  def index
    @user = current_user
    @book = Book.new
    @book.id = current_user
    @books = Book.all
  end
  
  def show
    @users = User.all
    @user = current_user
    @book = Book.new
    @book.user_id = current_user.id
    @book_detail = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:notice] = "successfully"
    redirect_to book_path(@book)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(current_user)
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
