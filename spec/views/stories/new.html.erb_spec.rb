require 'rails_helper'

RSpec.describe "stories/new", type: :view do
  before(:each) do
    assign(:story, Story.new(
      :title => "MyString",
      :slug => "MyString",
      :code => "MyString",
      :pages => 1,
      :description => "MyText"
    ))
  end

  it "renders new story form" do
    render

    assert_select "form[action=?][method=?]", stories_path, "post" do

      assert_select "input[name=?]", "story[title]"

      assert_select "input[name=?]", "story[slug]"

      assert_select "input[name=?]", "story[code]"

      assert_select "input[name=?]", "story[pages]"

      assert_select "textarea[name=?]", "story[description]"
    end
  end
end
