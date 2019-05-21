json.extract! book, :id, :isbn, :title, :publisher, :authors, :description, :category, :thumbnail, :page, :created_at, :updated_at
json.url book_url(book, format: :json)
