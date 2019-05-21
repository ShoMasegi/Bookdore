require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :isbn => "Isbn",
        :title => "Title",
        :publisher => "Publisher",
        :authors => "Authors",
        :description => "MyText",
        :category => "Category",
        :thumbnail => "Thumbnail",
        :page => 2
      ),
      Book.create!(
        :isbn => "Isbn",
        :title => "Title",
        :publisher => "Publisher",
        :authors => "Authors",
        :description => "MyText",
        :category => "Category",
        :thumbnail => "Thumbnail",
        :page => 2
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Publisher".to_s, :count => 2
    assert_select "tr>td", :text => "Authors".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Thumbnail".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
