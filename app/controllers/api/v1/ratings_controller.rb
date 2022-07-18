module Api
  module V1
    class RatingsController < ApplicationController
      before_action :set_recipe, only: %i[create]
      
    def create
        rating = Ratings.new(rating_params)
        rating.recipe = @rating_recipe#co ja robie
 
        if rating.save
          render json: rating
        else
          render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def rating_params
        params.require(:rating).permit(%i[rate])
      end

      def set_recipe
        @rating_recipe = Recipe.find(params[:recipe_id])
      end
    end
  end
end
      