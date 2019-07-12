require 'rails_helper'

RSpec.describe Comic, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }

    it { should validate_uniqueness_of(:upc) }
    it { should validate_numericality_of(:upc).only_integer.allow_nil.is_greater_than(100_000_000_000) }

    it { should validate_presence_of(:issue) }
    it { should validate_numericality_of(:issue) }
    it { should validate_uniqueness_of(:issue).scoped_to(:series_id) }
    it { should allow_value(0.5).for(:issue) }

    it { should validate_numericality_of(:pages).only_integer.allow_nil }

    it { should validate_numericality_of(:cover_price).allow_nil }
    it { should allow_value(3.99).for(:cover_price) }
    it { should allow_value(3.9).for(:cover_price) }

    it { should validate_numericality_of(:marvel_id).only_integer.allow_nil }
  end

  describe 'associations' do
    it { should belong_to(:series) }
  end
end
