class CardsController < ApplicationController

  def show
    @card = Card.find(params[:id])
  end

  def new
  end
end
