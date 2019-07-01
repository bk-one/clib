require 'rails_helper'

RSpec.describe "comics/index", type: :view do
  before(:each) do
    assign(:comics, [
      Comic.create!(
        :title => "Title",
        :issue => 2,
        :pages => 3,
        :dimensions => "Dimensions",
        :cover_price => "9.99",
        :currency => "Currency",
        :upc => "123456789012"
      ),
      Comic.create!(
        :title => "Title",
        :issue => 2,
        :pages => 3,
        :dimensions => "Dimensions",
        :cover_price => "9.99",
        :currency => "Currency",
        :upc => "123456789013"
      )
    ])
  end

  it "renders a list of comics" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Dimensions".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Currency".to_s, :count => 2
  end
end
