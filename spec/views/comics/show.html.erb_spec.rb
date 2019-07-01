require 'rails_helper'

RSpec.describe "comics/show", type: :view do
  before(:each) do
    @comic = assign(:comic, Comic.create!(
      :title => "Title",
      :issue => 2,
      :pages => 3,
      :dimensions => "Dimensions",
      :cover_price => "9.99",
      :currency => "Currency",
      :upc => "123456789012"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Dimensions/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Currency/)
    expect(rendered).to match(//)
  end
end
