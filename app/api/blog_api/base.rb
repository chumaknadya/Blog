module BlogApi
  class Base < Grape::API
    mount BlogApi::V1::Base
  end
end
  