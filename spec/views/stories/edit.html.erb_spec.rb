require 'rails_helper'

RSpec.describe "stories/edit", type: :view do
  before(:each) do
    @story = assign(:story, Story.create!(
      :title => "MyString",
      :slug => "MyString",
      :code => "MyString",
      :pages => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit story form" do
    render

    assert_select "form[action=?][method=?]", story_path(@story), "post" do

      assert_select "input[name=?]", "story[title]"

      assert_select "input[name=?]", "story[slug]"

      assert_select "input[name=?]", "story[code]"

      assert_select "input[name=?]", "story[pages]"

      assert_select "textarea[name=?]", "story[description]"
    end
  end
end
