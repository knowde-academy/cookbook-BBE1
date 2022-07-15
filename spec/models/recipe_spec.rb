require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
  end
end
