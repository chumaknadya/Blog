class Comment < ApplicationRecord
  belongs_to :article
  validates :commenter, presence: true,
            length: { minimum: 5 },
            uniqueness: true,
            format: {
              with:  /\A[\sA-Za-z0-9-]+\z/
            }
  validates :body, presence: true,
            length: { minimum: 5}          
end
