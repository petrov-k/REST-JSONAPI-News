# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < Api::V1::BaseController
      require 'pycall/import'
      include PyCall::Import

      def summarize
        article = Article.find(params[:id])
        text = article.content
        sentences_count = params[:sentences_count] || 3

        summary = summarize_text_with_python(text, sentences_count)
        render json: { summary: summary }

        private

        def summarize_text_with_python(text, sentences_count)
          pyimport '__main__', as: 'summarizer'
          summarizer_path = Rails.root.join('lib', 'tasks', 'summarize.py').to_s

          # Calling the Python script using PyCall
          PyCall.exec "exec(open('#{summarizer_path}').read())"
          summarizer.summarize_text(text, sentences_count)
        rescue StandardError => e
          logger.error "Python summarization error: #{e.message}"
          "Error summarizing text"
        end
      end
    end
  end
end
