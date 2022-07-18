require 'rails_helper'

RSpec.describe Rate, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:recipe) }
  end

  describe 'validations' do
    it { is_expected.to validate_ # jeszcze nie mam tu bedzie ze musi byc od 1 do 5
  end 