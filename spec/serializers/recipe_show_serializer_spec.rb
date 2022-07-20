require 'rails_helper'

describe RecipeShowSerializer do
  subject(:serialized_recipe) { described_class.new(recipe).to_h }

  let(:recipe) { build(:recipe) }

  it { is_expected.to include(name: recipe.name) }
  it { is_expected.to include(content: recipe.content) }

  describe '#comments' do
    let!(:comments) { create_list :comment, 2, recipe: recipe }
    let(:serialized_comments) do
      comments.sort_by(&:created_at).reverse!.map do |comment|
        CommentSerializer.new(comment).to_h
      end
    end

    it { is_expected.to include(comments: serialized_comments) }
  end

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

  describe '#cooking_time' do
    context 'with correct cooking_time' do
      it { is_expected.to include(cooking_time: recipe.cooking_time) }
    end

    context 'with incorrect cooking_time' do
      let!(:recipe) { build(:recipe, cooking_time: nil) }

      it { is_expected.to include(cooking_time: described_class::UNKNOWN) }
    end
  end


  describe '#avg_rate' do
    context 'with rates' do
      let!(:rate) { create_list :rate, 2, recipe: recipe, value: 3 }

      it { is_expected.to include(avg_rate: 3) }
    end

    context 'without rates' do
      it { is_expected.to include(avg_rate: 0) }
    end
 end
 
   describe '#rate_count' do
    context 'with rates' do
      let!(:rate) { create_list :rate, 2, recipe: recipe }

      it { is_expected.to include(rate_count: 2) }
    end

    context 'without rates' do
      it { is_expected.to include(rate_count: 0) }
    end
 end
 
 
 
 
  describe '#level' do
    context 'ith correct level' do
      it { is_expected.to include(level: recipe.level) }
    end

    context 'with incorrect level' do
      let!(:recipe) { build(:recipe, level: nil) }

      it { is_expected.to include(level: described_class::UNKNOWN) }

    end
  end
end
