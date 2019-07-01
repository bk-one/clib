require 'rails_helper'

RSpec.describe "comics/edit", type: :view do
  before(:each) do
    @comic = assign(:comic, Comic.create!(
      :title => "MyString",
      :issue => 1,
      :pages => 1,
      :dimensions => "MyString",
      :cover_price => "9.99",
      :currency => "MyString",
      :upc => "123456789012"
    ))
  end

  it "renders the edit comic form" do
    render

    assert_select "form[action=?][method=?]", comic_path(@comic), "post" do

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
