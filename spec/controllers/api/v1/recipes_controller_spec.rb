require 'rails_helper'

describe Api::V1::RecipesController do
  describe '[GET] #index' do
    before do
      create_list(:recipe, 5)
      get :index
    end

    it 'returns all recipes' do
      expect(JSON.parse(response.body)['data'].size).to eq(5)
    end
  end

  describe '[GET] #show' do
    let!(:recipe) { create(:recipe) }
    let(:expected_response) { RecipeShowSerializer.new(recipe).to_json }

    before do
      get :show, params: { id: recipe.to_param }
    end

    it 'returns requested recipe' do
      expect(response.body).to eq(expected_response)
    end
  end

  describe '[POST] #create' do
    let(:recipe_params) do
      {
        recipe: {
          name: 'Leczo',
          content: 'Very good dish',
          video_link: 'https://www.google.pl/',
          price: 5,
          cooking_time: 10
        }
      }
    end

    context 'with valid params' do
      it 'creates recipe' do
        expect do
          post :create, params: recipe_params
        end.to change(Recipe, :count).by(1)
      end
    end

    context 'with invalid params' do
      let(:recipe_params) do
        {
          recipe: {
            name: '',
            content: '',
            cooking_time: 'invalid',
            price: 'invalid',
            video_link: 'invalid'
          }
        }
      end

      it 'doesn\'t create recipe' do
        expect do
          post :create, params: recipe_params
        end.not_to change(Recipe, :count)
      end
    end

    context 'with invalid cooking_time' do
      let(:recipe_params) do
        {
          recipe: {
            name: 'testowe danie',
            content: 'testowy kontent',
            cooking_time: 'invalid',
            video_link: nil,
            prince: nil
          }
        }
      end

      context 'with invalid video_link' do
        let(:recipe_params) do
          {
            recipe: {
              name: 'testowe danie',
              content: 'testowy kontent',
              cooking_time: 22,
              video_link: 'invalid',
              prince: 11
            }
          }
        end
      end

      it 'doesn\'t create recipe' do
        expect do
          post :create, params: recipe_params
        end.not_to change(Recipe, :count)
      end
    end
  end

  describe '[PUT] #update' do
    let(:old_name) { 'Rosol' }
    let(:new_name) { 'Pierogi' }
    let(:old_cooking_time) { 1 }
    let(:new_cooking_time) { 1000 }
    let(:old_video_link) { 'https://www.google.pl/' }
    let(:new_video_link) { 'https://guides.rubyonrails.org/index.html' }
    let(:recipe) do
      create(:recipe, name: old_name, content: 'asdas', cooking_time: old_cooking_time, video_link: old_video_link)
    end

    context 'with valid params' do
      it 'updates name' do
        expect do
          put :update, params: { id: recipe.id, recipe: { name: new_name } }
        end.to change { recipe.reload.name }.from(old_name).to(new_name)
      end

      it 'returns updated object' do
        put :update, params: { id: recipe.id, recipe: { name: new_name } }
        expect(JSON.parse(response.body)['name']).to eq(new_name)
      end
    end

    context 'with valid cooking_time' do
      let(:recipe_put_params) do
        {
          id: recipe.id,
          recipe: { cooking_time: new_cooking_time }
        }
      end

      it 'updates cooking_time' do
        expect do
          put :update, params: recipe_put_params
        end.to change { recipe.reload.cooking_time }.from(old_cooking_time).to(new_cooking_time)
      end

      it 'returns updated object' do
        put :update, params: recipe_put_params
        expect(JSON.parse(response.body)['cooking_time']).to eq(new_cooking_time)
      end
    end

    context 'with valid video_link' do
      let(:recipe_put_video_link) do
        {
          id: recipe.id,
          recipe: { video_link: new_video_link }
        }
      end

      it 'updates video_link' do
        expect do
          put :update, params: recipe_put_video_link
        end.to change { recipe.reload.video_link }.from(old_video_link).to(new_video_link)
      end

      it 'returns updated object' do
        put :update, params: recipe_put_video_link
        expect(JSON.parse(response.body)['video_link']).to eq(new_video_link)
      end
    end

    context 'with invalid params' do
      let(:invalid_new_name) { '' }

      it 'doesn\'t update name' do
        expect do
          put :update, params: { id: recipe.id, recipe: { name: invalid_new_name } }
        end.not_to change { recipe.reload.name }
      end
    end

    context 'with invalid cooking_time' do
      let(:invalid_cooking_time) { 'invalid' }

      it 'doesn\'t update name' do
        expect do
          put :update, params: { id: recipe.id, recipe: { cooking_time: invalid_cooking_time } }
        end.not_to change { recipe.reload.cooking_time }
      end
    end

    context 'with invalid video_link' do
      let(:invalid_video_link) { 'invalid' }

      it 'doesn\'t update video_link' do
        expect do
          put :update, params: { id: recipe.id, recipe: { video_link: invalid_video_link } }
        end.not_to change { recipe.reload.video_link }
      end
    end
  end

  describe '[DELETE] #destroy' do
    let!(:recipe) { create(:recipe) }

    it 'destroys the recipe' do
      expect { delete :destroy, params: { id: recipe.id } }.to change(Recipe, :count).by(-1)
    end

    it 'returns destroyed object' do
      delete :destroy, params: { id: recipe.id }
      expect(JSON.parse(response.body)['name']).to eq(recipe.name)
    end
  end
end
