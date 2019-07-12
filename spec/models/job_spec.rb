require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'validations' do
    it { should validate_inclusion_of(:name).in_array(%w[artist writer]) }
    it { should belong_to(:person) }
    it { should belong_to(:creative_work) }
  end
end
