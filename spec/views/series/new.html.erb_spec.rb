require 'rails_helper'

RSpec.describe "series/new", type: :view do
  before(:each) do
    assign(:series, Series.new(
      :name => "MyString",
      :limited => false
    ))
  end

  it "renders new series form" do
    render

    assert_select "form[action=?][method=?]", series_index_path, "post" do

      assert_select "input[name=?]", "series[name]"

      assert_select "input[name=?]", "series[limited]"
    end
  end
end
