class CardsController < ApplicationController

  # GET /cards
  def index
    @cards = Card.all
  end

  # GET /cards/:id
  def show
    @card = Card.find(params[:id])
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/:id/edit
  def edit
    @card = Card.find(params[:id])
  end

  # POST /cards
  def create
    @card = Card.new(user_params)
    if @card.save
      flash[:success] = "Succeed to create card!"
      redirect_to @card
    else
      render 'new'
    end
  end

   # PATCH/PUT /cards/:id
  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(user_params)
      flash[:success] = "Updated the card!"
      redirect_to cards_path
    else
      render 'edit'
    end
  end

  # DELETE /cards/:id
  def destroy
    Card.find(params[:id]).destroy
    flash[:success] = "Card deleted!"
    redirect_to cards_path
  end

  private

  def user_params
    params.require(:card).permit(:book, :status)
  end
end
