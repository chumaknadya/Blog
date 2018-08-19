module BlogApi
    module V1
        class Base < Grape::API
            version 'v1', using: :path
            format  :json
            prefix :api
            mount BlogApi::V1::Articles
            mount BlogApi::V1::Comments
        end    
    end
end        