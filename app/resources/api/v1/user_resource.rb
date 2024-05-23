# frozen_string_literal: true

module Api
  module V1
    class UserResource < JSONAPI::Resource
      attributes :email
      has_many :articles
      has_many :comments
    end
  end
end
