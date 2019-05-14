class CardsController < ApplicationController

  # GET /cards
  def index
    @q = Card.ransack(params[:q])
    @cards = @q.result
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
      flash[:danger] = "Error : Failed to create card."
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
      flash[:danger] = "Error : Failed to update card."
      render 'edit'
    end
  end

  # DELETE /cards/:id
  def destroy
    if Card.find(params[:id]).destroy
      flash[:success] = "Card deleted!"
      redirect_to cards_path
    else
      flash[:danger] = "Error : Failed to delete card."
      render 'index'
    end
  end

  private

  def user_params
    params.require(:card).permit(:book, :status, :deadline)
  end
end
