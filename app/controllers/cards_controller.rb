class CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    # @q = current_user.cards.ransack(params[:q])
    # @cards = @q.result
    @cards = Card.all
    respond_to do |format|
      format.html
      format.json {
        render json: { "data": { "cards": @cards.as_json(include: [:book, :user]) } },
               status: :ok
      }
    end
  end

  # GET /cards/:id
  # GET /cards/:id.json
  def show
    # @card = current_user.cards.find(params[:id])
    @card = Card.all.find(params[:id])
    respond_to do |format|
      format.html
      format.json {
        render json: { "data": { "card": @card.as_json(include: [:book, :user]) } },
               status: :ok
      }
    end
  end

  # GET /cards/new
  # GET /cards/new.json
  def new
    @card = Card.new
  end

  # GET /cards/:id/edit
  # GET /cards/:id/edit.json
  def edit
    @card = Card.find(params[:id])
  end

  # POST /cards
  # POST /cards.json
  def create
    # @card = current_user.cards.new(user_params)
    @card = Card.new(user_params)
    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, flash: { success: "Succeed to create card!" } }
        format.json {
          render json: @card.as_json(include: [:book, :user]),
                 status: :created
        }
      else
        format.html {
          flash[:danger] = "Error : Failed to create card."
          render :new
        }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/:id
  # PATCH/PUT /cards/:id.json
  def update
    @card = Card.find(params[:id])
    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, flash: { success: "Updated the card!" } }
        format.json { render json: @card, status: :ok }
      else
        format.html {
          flash[:danger] = "Error : Failed to update card."
          render :edit
        }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/:id
  # DELETE /cards/:id.json
  def destroy
    respond_to do |format|
      if Card.find(params[:id]).destroy
        format.html { redirect_to cards_path, notice: "Card deleted!" }
        format.json { head :no_content }
      else
        format.html {
          flash[:danger] = "Error : Failed to delete card."
          render :index
        }
        format.json { head :no_content }
      end
    end
  end

  private

    def user_params
      params.require(:card)
          .permit(:user_id, :book_id, :status, :deadline, :spent_time_sec, :current_page)
    end
end
