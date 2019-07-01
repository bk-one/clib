require 'rails_helper'

RSpec.describe Series, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associastions' do
    it { should have_many(:comics) }
  end
end
