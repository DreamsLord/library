class RentsController < ApplicationController
  before_action :set_rent, only: %i[show edit update destroy]
  def index
    @rents = current_user.rents.all.page params[:page]
  end

  def show; end

  def edit; end

  def update
    if @rent.update(rent_params)
      flash.now[:notice] = 'rent modificated'
      redirect_to @rent
    else
      flash.now[:error] = 'Failed to modificated rent in database'
      render :edit
    end
  end

  def destroy
    @rent.destroy
  end

  def new
    @rent = current_user.rents.new
  end

  def create
    @rent = current_user.rents.new(rent_params)
    if @rent.save
      redirect_to @rent
      flash.now[:notice] = 'rent has been created'
    else
      flash.now[:error] = 'Failed to save rent'
      redirect_to new_rent_url(@rent)
    end
  end

  private

  def set_rent
    @rent = current_user.rents.find(params[:id])
  end

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :return?)
  end
end
