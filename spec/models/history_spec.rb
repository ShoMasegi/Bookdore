require 'rails_helper'

RSpec.describe History, type: :model do
  describe '#About validation' do

    it 'card should have concrete_history.' do
      @history = FactoryBot.build(:history)
      expect(@history).to be_valid
    end

    it 'creation card without concrete_history expect raise_error.' do
      expect {
        FactoryBot.create(:history, concrete_history: nil)
      }.to raise_error(ActiveRecord::RecordInvalid,
                       'Validation failed: Concrete history must exist')
    end

    context 'If concrete_history is read_history, ' do

      it 'page_count of read_history is less than or equal to page of book.' do
        @read_history = FactoryBot.create(:read_history, page_count: 40000)
        expect {
          FactoryBot.create(:history, concrete_history: @read_history)
        }.to raise_error ActiveRecord::RecordInvalid
      end
    end

    context 'If concrete_history is register_history, ' do

      it 'from and to of register_history is Card.statuses' do
        expect {
          FactoryBot.create(:register_history, from: 10, to: 3)
        }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
