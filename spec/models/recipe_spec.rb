require 'rails_helper'
require 'validate_url/rspec_matcher'

RSpec.describe Recipe, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:rates).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to allow_value(nil).for(:price) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
    it { is_expected.to allow_value(nil).for(:video_link) }
    it { is_expected.to validate_url_of(:video_link) }
    it { is_expected.to allow_value(nil).for(:cooking_time) }
    it { is_expected.to validate_numericality_of(:cooking_time).only_integer.is_greater_than(0) }
    it { is_expected.to allow_value(nil).for(:level) }
    it { is_expected.to validate_numericality_of(:level).is_greater_than(0).is_less_than(6) }
  end
end
