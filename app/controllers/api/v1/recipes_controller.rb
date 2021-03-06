module Api
  module V1
    class RecipesController < ApplicationController
      before_action :set_recipe, except: %i[create index]
      def index
        render json: { data: ActiveModel::SerializableResource.new(Recipe.all, each_serializer: RecipeSerializer) }
      end

      def show
        render json: RecipeShowSerializer.new(@recipe).to_h
      end

      def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
          render json: RecipeShowSerializer.new(@recipe).to_h
        else
          render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @recipe.update(recipe_params)
          render json: RecipeShowSerializer.new(@recipe).to_h
        else
          render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @recipe.destroy
          render json: RecipeShowSerializer.new(@recipe).to_h
        else
          render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def recipe_params
        params.require(:recipe).permit(%i[name content price video_link cooking_time level])
      end

      def set_recipe
        @recipe = Recipe.find(params[:id])
      end
    end
  end
end
