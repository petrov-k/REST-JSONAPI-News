# frozen_string_literal: true

module Api
  module V1
    class CategoryResource < JSONAPI::Resource
      attributes :name
      has_many :articles
    end
  end
end
