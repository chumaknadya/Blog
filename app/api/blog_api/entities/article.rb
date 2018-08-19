module BlogApi
    module Entities
        class Article < Grape::Entity
            format_with(:iso_timestamp) { |d| d.utc }
            expose :id
            expose :title
            expose :text
            with_options(format_with: :iso_timestamp) do
                expose :created_at
                expose :updated_at
            end
        end    
    end       
end