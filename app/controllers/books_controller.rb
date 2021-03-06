class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  def index
    @books = Book.includes(:rents).page params[:page]
  end

  def show; end

  def edit; end

  def update
    if @book.update(book_params)
      flash.now[:notice] = 'book modificated'
      redirect_to @book
    else
      flash.now[:error] = 'Failed to modificated book in database'
      render :edit
    end
  end

  def destroy
    @book.delete
    respond_to do |format|
      format.js { render layout: false }
      format.html { redirect_to books_path }
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
      flash.now[:notice] = 'book has been created'
    else
      flash.now[:error] = 'Failed to save book'
      render :new
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :author, :category, :description)
  end
end
