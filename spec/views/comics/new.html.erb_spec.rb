require 'rails_helper'

RSpec.describe "comics/new", type: :view do
  before(:each) do
    assign(:comic, Comic.new(
      :title => "MyString",
      :issue => 1,
      :pages => 1,
      :dimensions => "MyString",
      :cover_price => "9.99",
      :currency => "MyString",
      :upc => ""
    ))
  end

  it "renders new comic form" do
    render

    assert_select "form[action=?][method=?]", comics_path, "post" do

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
