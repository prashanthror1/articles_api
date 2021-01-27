class Comment < ApplicationRecord
  belongs_to :article

  validates :body, presence: true

  self.per_page = 2  
end
