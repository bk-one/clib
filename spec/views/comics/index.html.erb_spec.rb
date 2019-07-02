require 'rails_helper'

RSpec.describe "comics/index", type: :view do
  before(:each) do
    @comics = []
    @comics << create(:comic)
    @comics << create(:comic)
    assign(:comics, @comics)
    assign(:series, @comics.first.series)
  end

  it "renders a list of comics" do
    render
    assert_select "tr>td", :text => @comics.first.title.to_s, :count => 2
    assert_select "tr>td", :text => @comics.first.cover_price.to_s, :count => 2
  end
end
