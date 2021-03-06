class RentsController < ApplicationController
  before_action :set_rent, only: %i[show edit update destroy return_book]
  def index
    @rents = current_user.rents.includes(:book).page params[:page]
  end

  def edit
    update
  end

  def update
    if @rent.update(return?: true)
      flash[:notice] = 'book returned'
    else
      flash[:error] = 'Failed to return book'
    end
    redirect_to rents_path
  end

  def new
    @rent = current_user.rents.new
  end

  def create
    @rent = current_user.rents.new(rent_params)
    set_return_date
    if @rent.save
      flash[:notice] = 'book has been rented'
      redirect_to @rent.book
    else
      flash[:error] = 'Failed to rent the book'
      redirect_to books_path
    end
  end

  private

  def set_return_date
    @rent.return_date = Time.current + 30.days
  end

  def set_rent
    @rent = current_user.rents.find(params[:id])
  end

  def rent_params
    params.require(:rent).permit(:book_id)
  end
end
