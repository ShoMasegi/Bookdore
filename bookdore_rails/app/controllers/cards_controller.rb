class CardsController < ApplicationController

  def create
    @card = Card.new(user_params)
    if @card.save
      redirect_to @card
    else
      render 'new'
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
