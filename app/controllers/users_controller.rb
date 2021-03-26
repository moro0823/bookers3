class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @book.user_id = current_user.id
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @book.user_id = current_user.id
    @books = Book.all
    @books = @user.books
  end
  
  def edit
   @user = User.find(params[:id])
   if user == current_user
    render "edit"
   else
   redirect_to user_path(current_user)
   end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
     flash[:notice] = "successfully"
    else
      render:edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :opinion, :user_id)
  end
end
