require 'rails_helper'

describe ProductSerializer do
  subject(:serialized_product) { described_class.new(product).to_h }

  let(:product) { create(:product) }

  it { is_expected.to include(name: product.name) }
  it { is_expected.to include(quantity: product.quantity) }
end
