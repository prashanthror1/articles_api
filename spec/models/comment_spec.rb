require 'rails_helper'

RSpec.describe Comment, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it  { should belong_to(:article) }
  it  {should validate_presence_of(:body)}
end
