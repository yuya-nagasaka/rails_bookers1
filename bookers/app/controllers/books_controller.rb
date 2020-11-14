class BooksController < ApplicationController

  def index
    @books = Book.all
    @books = Book.order("id")
    @book=Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book=Book.new(book_params)
    @books = Book.all
    if @book.save
    redirect_to book_path(@book)
    else  render action: :index
    end
    flash[:notice] = "Book was successfully created."
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
     @book = Book.find(params[:id])
     if @book.update(book_params)
     redirect_to book_path(@book)
     else render action: :edit
     end
     flash[:notice] = "Book was successfully created."
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to "/books"
    flash[:notice] = "Book was successfully destroyed."
  end

   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
