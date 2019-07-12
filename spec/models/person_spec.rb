require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'validations' do
    it { should have_many(:jobs) }
  end
end
