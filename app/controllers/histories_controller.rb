class HistoriesController < ApplicationController

  # GET /histories
  # GET /histories.json
  def index
    @histories = History.all
    respond_to do |format|
      format.html
      format.json {
        render 'index', format: 'json', handlers: 'jbuilder', status: :ok
      }
    end
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
    @history = History. all.find(params[:id])
    respond_to do |format|
      format.html
      format.json {
        render 'show', format: 'json', handlers: 'jbuilder', status: :ok
      }
    end
  end

  # GET /histories/new
  def new
    @history = History.new
  end

  # GET /histories/1/edit
  def edit
  end

  # POST /histories
  # POST /histories.json
  def create
    @history = History.new(history_params)

    respond_to do |format|
      if @history.save
        format.html { redirect_to @history, notice: 'History was successfully created.' }
        format.json {
          render 'show', format: 'json', handlers: 'jbuilder', status: :created
        }
      else
        format.html { render :new }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    respond_to do |format|
      if @history.update(history_params)
        format.html { redirect_to @history, notice: 'History was successfully updated.' }
        format.json {
          render 'show', format: 'json', handlers: 'jbuilder', status: :ok
        }
      else
        format.html { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    respond_to do |format|
      if History.find(params[:id]).destroy
        format.html { redirect_to histories_url, notice: 'History was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html {
          flash[:danger] = "Error : Failed to delete history."
          render :index
        }
        format.json { head :no_content }
      end
    end
  end

  private

    def history_params
      params.require(:history).permit(:no-specs)
    end
end
