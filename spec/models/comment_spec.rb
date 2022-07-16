require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:recipe) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(10) }
    it { is_expected.to validate_length_of(:author).is_at_least(3) }
    it { is_expected.to allow_value(nil).for(:author) }
  end
end
