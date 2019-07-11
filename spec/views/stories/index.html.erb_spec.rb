require 'rails_helper'

RSpec.describe "stories/index", type: :view do
  before(:each) do
    assign(:stories, [
      Story.create!(
        :title => "Title",
        :slug => "Slug",
        :code => "Code",
        :pages => 2,
        :description => "MyText"
      ),
      Story.create!(
        :title => "Title",
        :slug => "Slug",
        :code => "Code",
        :pages => 2,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of stories" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
