require 'rails_helper'

RSpec.describe "jobs/show", type: :view do
  before(:each) do
    @job = assign(:job, create(:job))
  end

  it "renders attributes in <p>" do
    render
  end
end
