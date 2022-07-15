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
  describe '#video_link' do
    context 'with filled video_link' do
      it { is_expected.to include(video_link: recipe.video_link) }
    end

    context 'with empty video_link' do
      let!(:recipe) { build(:recipe, video_link: nil) }

      it { is_expected.to include(video_link: described_class::UNKNOWN) }
    end
  end
end
