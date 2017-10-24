class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    @books =  Book.all.page params[:page]
    @book = Book.new
  end

  def show
  end

  def edit
  end

  def update
    @books = Book.all
    @book.update_attributes(book_params)
  end

  def destroy
    @book.destroy
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :author, :category, :description)
  end


end
