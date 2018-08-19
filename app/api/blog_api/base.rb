module BlogApi
    class Base < Grape::API
      #mount BlogApi::V1::Articles
      #mount BlogApi::V1::Comments
      mount BlogApi::V1::Base
    end
  end
  