require 'rails_helper'

RSpec.describe Api::V1::Rest::ArticlesController, type: :controller do
  let(:user) { User.create!(email: 'first@email.com', password: 'password', password_confirmation: 'password') }
  let(:valid_attributes) {
    { title: 'Test Article', content: 'This is a test article.', user: user }
  }

  let(:invalid_attributes) {
    { title: nil, content: nil }
  }

  let(:token) { JsonWebToken.encode(user_id: user.id) }

  describe "GET #index" do
    it "returns a success response" do
      Article.create! valid_attributes
      get :index, headers: { 'Authorization' => "Bearer #{token}" }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      article = Article.create! valid_attributes
      get :show, params: { id: article.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Article" do
        expect {
          post :create, params: { article: valid_attributes }
        }.to change(Article, :count).by(1)
      end

      it "renders a JSON response with the new article" do
        post :create, params: { article: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Article" do
        expect {
          post :create, params: { article: invalid_attributes }
        }.to change(Article, :count).by(0)
      end

      it "renders a JSON response with errors for the new article" do
        post :create, params: { article: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PUT #update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { title: 'Updated Article', content: 'This is an updated test article.' }
      }

      it "updates the requested article" do
        article = Article.create! valid_attributes
        put :update, params: { id: article.to_param, article: new_attributes }
        article.reload
        expect(article.title).to eq('Updated Article')
        expect(article.content).to eq('This is an updated test article.')
      end

      it "renders a JSON response with the article" do
        article = Article.create! valid_attributes
        put :update, params: { id: article.to_param, article: new_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the article" do
        article = Article.create! valid_attributes
        put :update, params: { id: article.to_param, article: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
