class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params.require(:book).permit(:title, :author, :pages))
    if @book.save
      flash[:notice] = "本を登録しました"
      redirect_to books_path
    else
      flash.now[:alert] = "入力に問題があります"
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(params.require(:book).permit(:title, :author, :pages))
      flash[:notice] = "本の情報を更新しました"
      redirect_to books_path
    else
      flash.now[:alert] = "入力に問題があります"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "本を削除しました"
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end
end
