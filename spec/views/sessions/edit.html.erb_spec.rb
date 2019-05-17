require 'rails_helper'

RSpec.describe "sessions/edit", type: :view do
  before(:each) do
    @session = assign(:session, Session.create!(
      :new => "MyString"
    ))
  end

  it "renders the edit session form" do
    render

    assert_select "form[action=?][method=?]", session_path(@session), "post" do

      assert_select "input[name=?]", "session[new]"
    end
  end
end
