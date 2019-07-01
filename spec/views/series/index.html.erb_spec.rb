require 'rails_helper'

RSpec.describe "series/index", type: :view do
  before(:each) do
    @series = []
    @series << create(:series)
    @series << create(:series)
    assign(:series, @series)
  end

  it "renders a list of series" do
    render
    assert_select "tr>td", :text => @series.first.name.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
