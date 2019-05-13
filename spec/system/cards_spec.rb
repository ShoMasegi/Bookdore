require 'rails_helper'

describe 'Card create action: ', type: :system do
  before do
    # FactoryBot.create(:card, book: "Test Book", status: "Test Status")
  end

  context do
    before do
      visit new_card_path
      fill_in 'form_book', with: "Test Book"
      fill_in 'form_status', with: "Test Status"
      fill_in 'form_deadline', with: "2020-01-01 00:00:00"
      click_button "Create new card"
    end

    it 'card should be created.' do
      visit cards_path
      expect(page).to have_content "Test Book"
    end
  end
end
