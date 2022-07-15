require 'rails_helper'
require 'validate_url/rspec_matcher'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
    it { is_expected.to validate_url_of(:video_link) }
  end
end
