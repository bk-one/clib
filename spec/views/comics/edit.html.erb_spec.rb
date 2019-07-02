require 'rails_helper'

RSpec.describe "comics/edit", type: :view do
  before(:each) do
    @comic = create(:comic)
    @series = @comic.series
  end

  it "renders the edit comic form" do
    render

    assert_select "form[action=?][method=?]", series_comic_path(@series, @comic), "post" do

      assert_select "input[name=?]", "comic[title]"

      assert_select "input[name=?]", "comic[issue]"

      assert_select "input[name=?]", "comic[pages]"

      assert_select "input[name=?]", "comic[dimensions]"

      assert_select "input[name=?]", "comic[cover_price]"

      assert_select "input[name=?]", "comic[currency]"

      assert_select "input[name=?]", "comic[upc]"
    end
  end
end
