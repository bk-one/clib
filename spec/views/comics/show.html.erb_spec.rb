require 'rails_helper'

RSpec.describe "comics/show", type: :view do
  before(:each) do
    @comic = assign(:comic, create(:comic))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@comic.title}/)
    expect(rendered).to match(/#{@comic.cover_price}/)
  end
end
