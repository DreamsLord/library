class RentsController < ApplicationController
  before_action :set_rent, only: %i[show edit update destroy return_book]
  def index
    @rents = current_user.rents.all.page params[:page]
  end

  def show; end

  def edit;
    update
  end

  def update
    if @rent.update(return_params)
      flash.now[:notice] = 'book returned'
      redirect_to @rent
    else
      flash.now[:error] = 'Failed to return book'
      render :edit
    end
  end

  def new
    @rent = current_user.rents.new
  end

  def create
    @rent = current_user.rents.new(rent_params)
    if @rent.save
      redirect_to @rent
      flash.now[:notice] = 'book has been rented'
    else
      flash.now[:error] = 'Failed to rent the book'
      redirect_to new_rent_url(@rent)
    end
  end

  private

  def set_rent
    @rent = current_user.rents.find(params[:id])
  end

  def rent_params
    params.require(:rent).permit(:user_id, :book_id)
  end

  def return_params
    params.require(:rent).permit(:user_id, :book_id, :return?)
  end
end
