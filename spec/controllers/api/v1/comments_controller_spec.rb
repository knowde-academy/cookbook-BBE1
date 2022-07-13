require 'rails_helper'

RSpec.describe Api::V1::CommentsController do
  describe '[POST] #create' do
    let(:recipe) { create :recipe }
    let(:post_request) { post :create, params: recipe_params }

    context 'with correct params' do
      let(:recipe_params) do
        {
          comment: {
            author: 'Adam Mickiewicz',
            body: 'nininniimijijjijij'
          },
          recipe_id: recipe.id
        }
      end

      it 'creates a comment' do
        expect { post_request }.to change(Comment, :count).by(1)
      end

      it 'return status ok' do
        post_request
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with incorrect recipe params' do
      let(:recipe_params) do
        {
          comment: {
            author: 'Adam Mickiewciz',
            body: ''
          },
          recipe_id: recipe.id
        }
      end

      it 'doesnt creates a comment' do
        expect { post_request }.not_to change(Comment, :count)
      end

      it 'return status unprocessable_entity' do
        post_request
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
