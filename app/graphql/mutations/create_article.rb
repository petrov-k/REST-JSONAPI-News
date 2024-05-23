# frozen_string_literal: true

module Mutations
  class CreateArticle < Mutations::BaseMutation
    argument :title, String, required: true
    argument :content, String, required: true
    argument :user_id, ID, required: true
    argument :category_ids, [ID], required: false

    field :article, Types::ArticleType, null: false
    field :errors, [String], null: false

    def resolve(title:, content:, user_id:, category_ids: [])
      user = User.find(user_id)
      article = user.articles.new(title: title, content: content)
      article.category_ids = category_ids if category_ids.present?

      if article.save
        { article: article, errors: [] }
      else
        { article: nil, errors: article.errors.full_messages }
      end
    end
  end
end
