require 'rails_helper'

RSpec.describe Rate, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:recipe) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value).is_greater_than_or_equal_to(1) }
    it { is_expected.to validate_numericality_of(:value).is_less_than_or_equal_to(5) }
  end
end
