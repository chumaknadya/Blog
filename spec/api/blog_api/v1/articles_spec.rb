require 'spec_helper'
require 'rails_helper'

describe 'BlogApi::V1::Articles' do
    describe 'GET /api/v1/articles' do
        let(:article){ FactoryBot.create(:article, title: 'Hello', text: 'LKJLJOIJ')}
        let(:do_request){ get '/api/v1/articles' }
        let(:expected_response){ Article.all.to_json }
    
        it 'returns all articles' do
          do_request

          expect(response.status).to eq(200)
          expect(response.body).to eq(expected_response)
        end
      end
    
      describe 'GET /api/v1/articles/:article_id' do
        let(:article){ FactoryBot.create(:article, title: 'Hello1', text: 'LKJLJOIJ1')}
        let(:do_request){ get "/api/v1/articles/#{article.id}" }      
        let(:expected_response){ article.to_json }
       
        it 'return specific article' do
          do_request
         
          expect(response.status).to eq(200)
          expect(response.body).to eq(expected_response)
        end
      end
    
      describe 'POST /api/v1/articles' do
        let(:body) do { title: 'booms', text: 'black' } end
        let(:do_request) { post '/api/v1/articles', params: body }
    
        it 'create article' do
          do_request

          expect(response.status).to eq(201)
        end
      end
    
      describe 'DELETE /api/v1/articles/:article_id' do
        let(:article){ FactoryBot.create(:article, title: 'Hello1', text: 'LKJLJOIJ1')}
        let(:do_request){ delete "/api/v1/articles/#{article.id}" }
    
        it 'return delete response' do
          do_request

          expect(response.status).to eq(204)
          expect(Article.count).to eq(0)
        end
      end
    
      describe 'PUT /api/v1/articles/:article_id' do
        let(:article) { FactoryBot.create(:article, title: 'Hello1', text: 'LKJLJOIJ1') }
        let(:body) do { title: 'booms', text: 'black' } end
        let(:do_request) { put "/api/v1/articles/#{article.id}", params: body }
        it 'update put response' do
          do_request
  
          expect(response.status).to eq(200)
          expect(response.body).to eq(Article.first.to_json)
        end
      end
    
end    