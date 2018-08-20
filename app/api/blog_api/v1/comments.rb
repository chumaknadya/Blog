module BlogApi
    module V1
      class Comments < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api
        namespace 'articles/:article_id' do
            ########################### GET articles/{article_id}/comments/
            desc 'Return list of comments'
            params do
              requires :article_id, type:String
            end
            get '/comments' do
              article = Article.find(params[:article_id])
              comment = article.comments.all
              present comment, with: Entities::Comment
            end
            ########################### DELETE articles/{article_id}/comments/{id}
            desc 'Delete comment by id'
            params do
              requires :article_id, type:String
              requires :id, type: String
            end
            delete '/comments/:id' do
              article = Article.find(params[:article_id])
              comment = article.comments.find(params[:id])
              comment.destroy
              status 204
            end
            ########################### GET articles/{article_id}/comments/{id}
            desc 'Find comment by id'
            params do
              requires :article_id, type: String
              requires :id, type: String
            end
            get '/comments/:id' do
              article = Article.find(params[:article_id])
              comment = article.comments.find(params[:id])
              present comment, with: Entities::Comment
            end
            ########################## POST articles/{article_id}/comments?commenter={commenter}&body={body}
            desc 'Create comments'
            params do
              requires :article_id, type: String
              requires :commenter, type: String
              requires :body, type: String
            end  
            post '/comments' do
              comment = Article.find(params[:article_id]).comments.create({article_id: params[:article_id], commenter:params[:commenter],body:params[:body]})
              if comment.errors.any?
                error!(comment.errors.full_messages.to_sentence, 422)
              end  
            end
          end  
      end
    end
  end
  