require 'rails_helper'

describe 'BlogApi::V1::Comments' do
  let(:article) { Article.create({title: 'asdasdasdaas', text: 'asdasdasdasdasd'})}
  let(:first_comment) { article.comments.create( {commenter: 'Nadine', body: 'asdasdasdasd'})}
  let(:second_comment) { article.comments.create( {commenter: 'Nadine1', body: 'asdasdasdasd2'})}

  describe 'GET /api/v1/articles/:article_id/comments' do

    let(:do_request) { get "/api/v1/articles/#{article.id}/comments" }

    it 'return all comments' do
      do_request

      expect(response.status).to eq(200)
      expect(response.body).to eq(article.comments.all.to_json)
    end
  end

  describe 'GET /api/v1/articles/:article_id/comments/:comment_id' do

    let(:do_request) { get "/api/v1/articles/#{article.id}/comments/#{first_comment.id}" }

    it 'return specific comments' do
      do_request

      expect(response.status).to eq(200)
      expect(response.body).to eq(article.comments.find_by_id(first_comment.id).to_json)
    end
  end

  describe 'POST /api/v1/articles/:article_id/comments' do
    let(:body) do { commenter: 'booms', body: 'black' } end
    let(:do_request) { post "/api/v1/articles/#{article.id}/comments", params: body }

    it 'create comment' do
      do_request
      expect(response.status).to eq(201)
    end
  end

  describe 'DELETE /api/v1/articles/:article_id/comments/:comment_id' do
    let(:do_request) {delete "/api/v1/articles/#{article.id}/comments/#{first_comment.id}"}

    it 'return delete response' do
      do_request
      expect(response.status).to eq(204)
    end
  end
end
