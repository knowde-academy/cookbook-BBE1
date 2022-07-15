require 'rails_helper'

describe CommentSerializer do
  subject { described_class.new(comment).to_h }

  let(:comment) { build :comment }

  it { is_expected.to include(body: comment.body) }
  it { is_expected.to include(id: comment.id) }
  it { is_expected.to include(created_at: comment.created_at) }

  describe '#author' do
    context 'when comment with author' do
      it { is_expected.to include(author: comment.author) }
    end

    context 'when commnet without author' do
      let(:comment) { build :comment, author: nil }

      it { is_expected.to include(author: 'annonymous') }
    end
  end
end
