require 'test_helper'

class CardTest < ActiveSupport::TestCase

  def setup
    @card = Card.new(book: "Example Book", status: "Example Status")
  end

  test "should be valid" do
    assert @card.valid?
  end

  test "status should be present" do
    @card.status = "a"
    assert @card.valid?
  end

  test "book should not be too long" do
    @card.book = "a" * 50
    assert @card.valid?
  end

  test "status should not be too long" do
    @card.status = "a" * 50
    assert @card.valid?
  end

  test "book should be unique" do
    duplicate_card = @card.dup
    duplicate_card.book = "another example book"
    @card.save
    assert duplicate_card.valid?
  end
end
