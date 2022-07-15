require 'rails_helper'

describe RecipeShowSerializer do
  subject(:serialized_recipe) { described_class.new(recipe).to_h }

  let(:recipe) { build(:recipe) }

  it { is_expected.to include(name: recipe.name) }
  it { is_expected.to include(content: recipe.content) }

  describe '#price' do
    context 'with price ' do
      it { is_expected.to include(price: recipe.price) }
    end

    context 'without price ' do
      let(:recipe) { build(:recipe, price: nil) }

      it { is_expected.to include(price: described_class::UNKNOWN) }
    end
  end
end
