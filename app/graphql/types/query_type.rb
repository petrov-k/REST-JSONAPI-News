# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Query to fetch all articles
    field :articles, [Types::ArticleType], null: false do
      description 'Retrieve a list of articles'
    end
    def articles
      Article.all
    end

    # Query to fetch a single article by ID
    field :article, Types::ArticleType, null: false do
      description 'Retrieve a single article by ID'
      argument :id, ID, required: true
    end
    def article(id:)
      Article.find(id)
    end

    # Query to fetch all comments
    field :comments, [Types::CommentType], null: false do
      description 'Retrieve a list of all comments'
    end
    def comments
      Comment.all
    end

    # Query to fetch a single comment by ID
    field :comment, Types::CommentType, null: false do
      description 'Retrieve a single comment by ID'
      argument :id, ID, required: true
    end
    def comment(id:)
      Comment.find(id)
    end

    # Query to fetch all users
    field :users, [Types::UserType], null: false do
      description 'Retrieve a list of all users'
    end
    def users
      User.all
    end

    # Query to fetch a single user by ID
    field :user, Types::UserType, null: false do
      description 'Retrieve a single user by ID'
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    # Query to fetch all categories
    field :categories, [Types::CategoryType], null: false do
      description 'Retrieve a list of all categories'
    end
    def categories
      Category.all
    end

    # Query to fetch a single category by ID
    field :category, Types::CategoryType, null: false do
      description 'Retrieve a single category by ID'
      argument :id, ID, required: true
    end
    def category(id:)
      Category.find(id)
    end
  end
end
