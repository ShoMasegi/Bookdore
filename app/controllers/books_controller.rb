class BooksController < ApplicationController

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path, flash: { success: "Create new book : #{@book.title}." }
    else
      flash[:danger] = "Error : Failed to create book."
      render :new
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to book_path(@book), flash: { success: "Update book data: #{@book.title}." }
    else
      flash[:danger] = "Error : Failed to update book."
      render :new
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path, flash: { success: "Book was successfully destroyed." }
    else
      flash[:danger] = "Error : Failed to delete book."
      render :index
    end
  end

  private

    def book_params
      params.require(:book).permit(:isbn, :title, :publisher, :authors, :description, :category, :thumbnail, :page)
    end
end
