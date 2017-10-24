class BooksController < ApplicationController

  def index
    @books =  Book.all.page params[:page]
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

end
