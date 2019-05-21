require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :isbn => "MyString",
      :title => "MyString",
      :publisher => "MyString",
      :authors => "MyString",
      :description => "MyText",
      :category => "MyString",
      :thumbnail => "MyString",
      :page => 1
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input[name=?]", "book[isbn]"

      assert_select "input[name=?]", "book[title]"

      assert_select "input[name=?]", "book[publisher]"

      assert_select "input[name=?]", "book[authors]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[category]"

      assert_select "input[name=?]", "book[thumbnail]"

      assert_select "input[name=?]", "book[page]"
    end
  end
end
