# frozen_string_literal: true

module Api
  module V1
    class ArticleResource < JSONAPI::Resource
      attributes :title, :content
      has_one :user
      has_many :comments
      has_many :categories
    end
  end
end
