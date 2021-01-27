#require 'elasticsearch/model'

class Article < ApplicationRecord
#  include Elasticsearch::Model
#  include Elasticsearch::Model::Callbacks

  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 10 }
  validates :body, presence: true

  self.per_page = 3
end

#Article.__elasticsearch__.create_index!
#Article.import
