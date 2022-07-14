require 'rails_helper'

describe RecipeShowSerializer do
  subject(:serialized_recipe) { described_class.new(recipe).to_h }

  let(:recipe) { build(:recipe) }

  it { is_expected.to include(name: recipe.name) }
  it { is_expected.to include(content: recipe.content) }

  describe '#cooking_time' do
    context 'with correct cooking_time' do
      it { is_expected.to include(cooking_time: recipe.cooking_time) }
    end

    context 'with incorrect cooking_time' do
      let!(:recipe) { build(:recipe, cooking_time: nil) }

      it { is_expected.to include(cooking_time: 'unknown') }
    end
  end
end
