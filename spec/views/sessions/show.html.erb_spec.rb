require 'rails_helper'

RSpec.describe "sessions/show", type: :view do
  before(:each) do
    @session = assign(:session, Session.create!(
      :new => "New"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/New/)
  end
end
