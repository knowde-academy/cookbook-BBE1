module Api
  module V1
    class RatingsController < ApplicationController
      before_action :set_recipe
      
    def create
        rating = Ratings.new(ratings_params)
        rating.recipe = @recipe
 
        if rating.save
          render json: rating
        else
          render json: { errors: rating.errors.full_messages }, status: :unprocessable_entity
        end
    end

      private

      def ratings_params
        params.require(:rating).permit(:rate)
      end

      def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
      end
    end
  end
end
      