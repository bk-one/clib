require 'rails_helper'

RSpec.describe "series/show", type: :view do
  before(:each) do
    @series = create(:series)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@series.name}/)
  end
end
