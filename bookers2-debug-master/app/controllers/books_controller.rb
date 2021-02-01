class BooksController < ApplicationController
  before_action :authenticate_user!
  #6解答　before_action :authenticate_user!追記
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  #29 before_action :ensure_correct_user, only: [:edit, :update, :destroy]追記

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
    #17 @book = Book.new追記
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    #29解答　@book = Book.find(params[:id])削除
  end



  def update
    #29解答　@book = Book.find(params[:id])削除
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    #23 delete=>destroy
    #29解答　@book = Book.find(params[:id])削除
    @book.destroy
    #23 destoy=>destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
    #19 :body追記
  end
  
  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
  #29 def ensure_correct_user
    #@book = Book.find(params[:id])
   #unless @book.user == current_user
      #redirect_to books_path
    #end
  #end 追記

end
