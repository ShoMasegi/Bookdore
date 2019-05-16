require 'rails_helper'

RSpec.describe "sessions/index", type: :view do
  before(:each) do
    assign(:sessions, [
      Session.create!(
        :new => "New"
      ),
      Session.create!(
        :new => "New"
      )
    ])
  end

  it "renders a list of sessions" do
    render
    assert_select "tr>td", :text => "New".to_s, :count => 2
  end
end
