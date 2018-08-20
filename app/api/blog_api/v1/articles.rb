module BlogApi
    module V1
      class Articles < Grape::API
        resource :articles do
          #############################  GET /api/v1/articles
          desc 'Return list of article'
          get do
            articles = Article.all
            present articles, with: Entities::Article
          end
          # ########################## DELETE /api/v1/articles/{id}
          desc 'Delete article by id'
          params do
            requires :article_id, type: Integer, desc: "Id of the article"
          end
          delete ':article_id' do
            article = Article.find(params[:article_id])
            article.destroy
            status 204
          end
          ########################## GET /api/v1/articles/{id}
          desc 'Find article by id'
          params do
            requires :article_id, type: Integer, desc: "Id of the article"
          end
          get ':article_id' do
            article = Article.find(params[:article_id])
            present article, with: Entities::Article
          end
          ########################## POST /api/v1/articles?title={title}&text={text}
          desc 'Create article'
          params do
           requires :title, type: String,regexp: /\A[\sA-Za-z0-9-]+\z/
           requires :text, type: String
          end
          post do
            article = Article.create({title:params[:title], text:params[:text]})
            if article.errors.any?
              error!(article.errors.full_messages.to_sentence, 422)
            end  
          end
          ########################## PUT /api/v1/articles/{id}
          desc 'Update an article'
          params do
            requires :id, type: Integer, desc: "Id of the article"
            requires :title, type: String,regexp: /\A[\sA-Za-z0-9-]+\z/
            requires :text, type: String
          end  
          put ':id' do
            article = Article.find(params[:id])
            unless article.update(params)
              error!(article.errors.full_messages.to_sentence, 422)
            end
            present article, with: Entities::Article
          end
        end
      end
    end
  end
  