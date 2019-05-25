require 'rails_helper'

RSpec.describe Card, type: :model do
  describe '#About validation' do
    before 'create card' do
      @book = FactoryBot.create(:book, page: 400)
      @user = FactoryBot.create(:user)
      @card = Card.new(deadline: '2019-10-20 20:00:00.000000',
                       status: 2,
                       user_id: @user.id,
                       book_id: @book.id,
                       spent_time_sec: 60000,
                       current_page: 20)
    end

    it 'deadline should not be filled with anythings other than datetime.' do
      @card.deadline = 'anythings other than datetime'
      expect(@card).not_to be_valid
    end

    it 'status should be Card.status.' do
      expect { @card.status = 10 }.to raise_error(ArgumentError)
    end

    it 'card should be associated with book.' do
      expect { @card.book = 1000 }.to raise_error ActiveRecord::AssociationTypeMismatch
    end

    it 'card should be associated with user.' do
      expect { @card.user = 1000 }.to raise_error ActiveRecord::AssociationTypeMismatch
    end

    context 'If card is associated with user and book, ' do

      it 'current page should not be more than page count of the book.' do
        @card.current_page = 401
        expect(@card).not_to be_valid
      end

      it 'current page should not be less than 0.' do
        @card.current_page = -20
        expect(@card).not_to be_valid
      end
    end

  end

end
