module Api
  module V1
    class RatesController < ApplicationController
      before_action :set_recipe

      def create
        rate = @recipe.rates.new(rate_params)

        if rate.save
          render json: rate
        else
          render json: { errors: rate.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def rate_params
        params.require(:rate).permit(:value)
      end

      def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
      end
    end
  end
end
