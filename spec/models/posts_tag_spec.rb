require 'rails_helper'

RSpec.describe PostsTag, type: :model do
  subject { described_class.new(
		post_id: 1,
		tag_id: 3
	)}
	
  context 'validations' do
    
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'should not be valid if PostTag already exists' do

      #this posttag already exists from seeding

      new_posttag = PostsTag.new(
        post_id: 1,
        tag_id: 1
      )
      expect(new_posttag).to_not be_valid
    end

    it "should be invalid if the post it links to doesn't exist" do
      subject.post_id = Post.last.id + 1
      expect(subject).to_not be_valid
    end

	end
end