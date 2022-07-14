require 'rails_helper'

describe RecipeSerializer do
  subject(:serialized_recipe) { described_class.new(recipe).to_h }
  UNKNOWN = 'unknown'
  let(:recipe) { build(:recipe) }

  it { is_expected.to include(name: recipe.name) }
  it { is_expected.to include(content: recipe.content) }
  
  describe 'RecipeSerializer running' do
    context 'with correct cooking_time' do
      it { is_expected.to include(cooking_time: recipe.cooking_time) }
    end
    
    context 'with incorrect cooking_time' do
      let!(:recipe) do
      {
        name: 'testowe danie',
        content: 'testowy content',
        cooking_time: nil
      }
      it { is_expected.to include(cooking_time: recipe.cooking_time) }
      end
    end
  end
end
