RSpec.describe Comment, type: :model do
    it { should validate_presence_of(:commenter) }
    it { should validate_presence_of(:body) }
    it { should validate_uniqueness_of(:commenter) }
    it { should belong_to(:article) }
end    