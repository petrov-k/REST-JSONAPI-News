require 'rails_helper'

RSpec.describe Api::V1::Rest::CommentsController, type: :controller do
  let(:article) { Article.create! valid_article_attributes }
  let(:user) { User.create!(email: 'test@mail.com', password: 'password', password_confirmation: 'password') }
  let(:valid_article_attributes) { { title: 'Test Article', content: 'This is a test article.', user: user } }
  let(:valid_attributes) { { content: 'A comment', article_id: article.id, user: user } }
  let(:invalid_attributes) { { content: '', article_id: article.id } }

  describe "GET #index" do
    it "returns a success response" do
      Comment.create! valid_attributes
      get :index, params: { article_id: article.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Comment" do
        expect {
          post :create, params: { article_id: article.to_param, comment: valid_attributes }
        }.to change(Comment, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Comment" do
        expect {
          post :create, params: { article_id: article.to_param, comment: invalid_attributes }
        }.to change(Comment, :count).by(0)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, params: { article_id: article.to_param, id: comment.to_param }
      }.to change(Comment, :count).by(-1)
    end
  end
end
