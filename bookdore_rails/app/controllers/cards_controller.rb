class CardsController < ApplicationController

  def show
    @card = Card.find(params[:id])
  end
  def index
    @cards = Card.all
  end

  def new
  end
end
