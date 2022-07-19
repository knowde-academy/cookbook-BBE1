require 'rails_helper'

RSpec.describe Api::V1::RatesController do
  describe '[POST] #create' do
    let(:recipe) { create :recipe }
     let(:post_request) { post :create, params: recipe_params }
     
     context 'with correct values' do
       let(:recipe_params) do
        {
          rate: { 
           value: 4 
          }, 
          recipe_id: recipe.id
        }
        end
      
      it 'create a rating' do
        expect { post_request}.to change(Rate, :count).by(1) 
       end
       
      it 'return status ok' do
        post_request
        expect(response).to have_http_status(:ok)
      end 
  end
  
    context 'with incorrect rate' do
      let(:recipe_params) do
        {
          rate: {
           value: 6
          },
          recipe_id: recipe.id
        }
      end 
      
      it 'doesnt create a rate' do
           expect { post_request }.not_to change(Rate, :count)
      end
      
      it 'return status unprocessable_entity' do
        post_request
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end  
      
      