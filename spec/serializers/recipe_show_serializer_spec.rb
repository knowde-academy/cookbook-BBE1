require 'rails_helper'

describe RecipeShowSerializer do
  subject(:serialized_recipe) { described_class.new(recipe).to_h }

  let(:recipe) { build(:recipe) }

  describe '#video_link' do
    context 'with filled video_link' do
      it { is_expected.to include(video_link: recipe.video_link) }
    end

    context 'with empty video_link' do
      let!(:recipe) { build(:recipe, video_link: nil) }

      it { is_expected.to include(video_link: 'unknown') }
    end
  end
end
