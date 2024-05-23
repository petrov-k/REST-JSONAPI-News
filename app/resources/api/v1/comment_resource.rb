# frozen_string_literal: true

module Api
  module V1
    class CommentResource < JSONAPI::Resource
      attributes :content
      has_one :user
      has_one :article
    end
  end
end
