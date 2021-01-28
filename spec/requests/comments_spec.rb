# spec/requests/comments_spec.rb
require 'rails_helper'

RSpec.describe 'Comments API' do
  # Initialize the test data
  let!(:article) { create(:article) }
  let!(:comments) { create_list(:comment, 20, article_id: article.id) }
  let(:article_id) { article.id }
  let(:id) { comments.first.id }

  # Test suite for GET comments
  describe 'GET /comments' do
    before { get "/comments" }

    context 'when article exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns 2 article comments since paginated to 2' do
        expect(json.size).to eq(2)
      end
    end
  end

  # Test suite for GET comments/:id
  describe 'GET /comments/:id' do
    before { get "/comments/#{id}" }

    context 'when article comment exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the comment' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when article comment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  # Test suite for PUT /comments
  describe 'POST /comments' do
    let(:valid_attributes) { { commenter: 'Visit Narnia', article_id: article_id, body: "Sample test comment for Article number 1" } }

    context 'when request attributes are valid' do
      before { post "/comments", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/comments", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Article must exist, Body can't be blank/)
      end
    end
  end

  # Test suite for PUT comments/:id
  describe 'PUT comments/:id' do
    let(:valid_attributes) { { commenter: 'Mozart' } }

    before { put "/comments/#{id}", params: valid_attributes }

    context 'when comment exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the comment' do
        updated_comment = Comment.find(id)
        expect(updated_comment.commenter).to match(/Mozart/)
      end
    end

    context 'when the comment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  # Test suite for DELETE /comment/:id
  describe 'DELETE /comments/:id' do
    before { delete "/comments/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
