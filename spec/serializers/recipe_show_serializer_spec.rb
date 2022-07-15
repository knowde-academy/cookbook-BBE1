require 'rails_helper'

describe RecipeShowSerializer do
  subject(:serialized_recipe) { described_class.new(recipe).to_h }

  let(:recipe) { build(:recipe) }

  it { is_expected.to include(name: recipe.name) }
  it { is_expected.to include(content: recipe.content) }

  describe '#price' do
    context 'with price' do
      it { is_expected.to include(price: recipe.price) }
    end

    context 'without price' do
      let(:recipe) { build(:recipe, price: nil) }

      it { is_expected.to include(price: described_class::UNKNOWN) }
    end
  end
      
  describe '#cooking_time' do
    context 'with correct cooking_time' do
      it { is_expected.to include(cooking_time: recipe.cooking_time) }
    end

    context 'with incorrect cooking_time' do
      let!(:recipe) { build(:recipe, cooking_time: nil) }

      it { is_expected.to include(cooking_time: described_class::UNKNOWN) }
    end
  end
end
