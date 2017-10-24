class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    @books =  Book.all.page params[:page]
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @book.destroy
    respond_to :js
  end

  def new
    @book = Book.new
  end

  def create
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :author, :category, :description)
  end


end
