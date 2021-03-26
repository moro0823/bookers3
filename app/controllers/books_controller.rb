class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @books = Book.all
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "successfully"
    else
      render :index
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
    @book = Book.new
    @book.user_id = current_user.id
    @book_detail = Book.find(params[:id])
    @user = @book_detail.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    flash[:notice] = "successfully"
    else
      render :edit
    end
  end
  

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
