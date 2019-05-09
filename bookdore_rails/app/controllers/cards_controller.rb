class CardsController < ApplicationController

  def create
    @card = Card.new(user_params)
    if @card.save
      flash[:success] = "Succeed to create card!"
      redirect_to @card
    else
      render 'new'
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(user_params)
      flash[:success] = "Updated the card!"
      redirect_to :action => 'index'
    else
      render 'edit'
    end
  end

  def show
    @card = Card.find(params[:id])
  end
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  private

  def user_params
    params.require(:card).permit(:book, :status)
  end
end
