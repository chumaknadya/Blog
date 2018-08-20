class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, presence: true,
              length: { minimum: 5 },
              uniqueness: true,
               format: {
                   with:  /\A[\sA-Za-z0-9-]+\z/
               }
    validates :text, presence: true,
              length: { minimum: 5}
    



end
