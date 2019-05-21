require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :isbn => "Isbn",
      :title => "Title",
      :publisher => "Publisher",
      :authors => "Authors",
      :description => "MyText",
      :category => "Category",
      :thumbnail => "Thumbnail",
      :page => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Isbn/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Publisher/)
    expect(rendered).to match(/Authors/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Thumbnail/)
    expect(rendered).to match(/2/)
  end
end
