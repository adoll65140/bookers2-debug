class UsersController < ApplicationController
  before_action :authenticate_user!
  #6解答　before_action :authenticate_user!追記
  before_action :ensure_correct_user, only: [:update, :edit]
  #26 , :edit追記

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end
  #2 end追記

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
      #15 users_path=>user_path
    else
      render "edit"
      #16 show=>edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
