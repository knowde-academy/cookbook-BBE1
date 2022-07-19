require 'rails_helper'

describe RateSerializer do
  subject { described_class.new(rate).to_h }

  let(:rate) { build :rate }

  it { is_expected.to include(value: rate.value) }
end
