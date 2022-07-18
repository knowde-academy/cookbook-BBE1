module Api
  module V1
    class RatesController < ApplicationController
      before_action :set_recipe
      
    def create
        rate = rate.new(rate_params)
        rate.recipe = @rating_recipe
 
        if rating.save
          render json: rate
        else
          render json: { errors: rate.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def rating_params
        params.require(:comment).permit(%i[rate])
      end

      def set_recipe
        @rating_recipe = Recipe.find(params[:recipe_id])
      end
    end
  end
end
      