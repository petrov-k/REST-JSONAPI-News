# frozen_string_literal: true

module Api
  module V1
    module Rest
      class CommentsController < ApplicationController
        before_action :set_article

        def index
          @comments = @article.comments
          render json: @comments
        end

        def create
          @comment = @article.comments.new(comment_params)
          if @comment.save
            render json: @comment, status: :created
          else
            render json: @comment.errors, status: :unprocessable_entity
          end
        end

        def destroy
          @comment = @article.comments.find(params[:id])
          @comment.destroy
          head :no_content
        end

        private

        def set_article
          @article = Article.find(params[:article_id])
        end

        def comment_params
          params.require(:comment).permit(:content)
        end
      end
    end
  end
end
