require 'rails_helper'

RSpec.describe PostsTag, type: :model do
  subject { described_class.new(
		post_id: Post.first.id,
		tag_id: Tag.last.id
	)}
	
  context 'validations' do
    
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end

    it "should be invalid if the post it links to doesn't exist" do
      subject.post_id = Post.last.id + 1
      expect(subject).to_not be_valid
    end

    it "should be invalid if the tag it links to doesn't exist" do
      subject.post_id = Tag.last.id + 1
      expect(subject).to_not be_valid
    end

	end
end