module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_recipe, only: %i[create]

      def create
        comment = Comment.new(comment_params)
        comment.recipe = @recipe
        if comment.save
          render json: comment
        else
          render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(%i[author body])
      end

      def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
      end
    end
  end
end
