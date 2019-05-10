require 'rails_helper'

describe 'Card create action: ', type: :system do
  before do
    FactoryBot.create(:card, book: "Test Book", status: "Test Status")
  end

  context 'Create another card.' do
    before do
      visit new_card_path
      fill_in 'form_book', with: "Test Book2"
      fill_in 'form_status', with: "Test Status2"
      click_button "Create new card"
    end

    it 'Cards should be created.' do
      visit cards_path
      expect(page).to have_content "Test Book"
      expect(page).to have_content "Test Book2"
    end
  end
end
