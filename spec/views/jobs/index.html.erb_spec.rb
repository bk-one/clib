require 'rails_helper'

RSpec.describe "jobs/index", type: :view do
  before(:each) do
    @person = assign(:person, Person.create)
    @comic = assign(:comic, Comic.create)
    assign(:jobs, [create(:job), create(:job)])
  end

  it "renders a list of jobs" do
    render
  end
end
