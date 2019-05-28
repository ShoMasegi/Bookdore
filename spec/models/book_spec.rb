require 'rails_helper'

RSpec.describe Book, type: :model do

  describe '#About validation#' do
    before 'create book' do
      @book = FactoryBot.build(:book)
    end

    context 'If book has ISBN, ' do

      it '10 length number is valid for the ISBN' do
        @book.isbn = '0123456789'
        expect(@book).to be_valid
      end
      it '13 length number is valid for the ISBN' do
        @book.isbn = '0123456789012'
        expect(@book).to be_valid
      end
      it '9 length number is invalid for the ISBN' do
        @book.isbn = '012345678'
        expect(@book).not_to be_valid
      end
      it '10 length string is invalid for the ISBN' do
        @book.isbn = 'ABCDEFGHIJ'
        expect(@book).not_to be_valid
      end

      it 'Book.isbn must be uniqueness' do
        same_isbn = '1234567890'
        FactoryBot.create(:book, isbn: same_isbn)
        same_isbn_book = Book.new(isbn: same_isbn, title: 'title')
        expect(same_isbn_book).not_to be_valid
      end
    end

    context 'If book does not have ISBN, ' do

      it  'There must not be the same title, authors, page book.' do
        same_title = 'same title'
        same_authors = %w(same_person1 same_person2 same_person3)
        same_page = 678
        FactoryBot.create(:book, isbn: nil,
                          title: same_title,
                          authors: same_authors,
                          page: same_page)
        same_book = Book.new(isbn: nil,
                             title: same_title,
                             authors: same_authors,
                             page: same_page)
        expect(same_book).not_to be_valid
      end
    end

    it 'Book.page must be greater than or equal to 0' do
      @book.page = -20
      expect(@book).not_to be_valid
    end
  end

  describe 'There should not be the same book' do
    context 'If book dose not have ISBN, ' do

    end
  end
end
