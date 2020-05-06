require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.create(
    content: "I have so much test aha",
    user_id: 1
  )}
  context 'validations' do
    it 'should exist when given valid attributes' do
      expect(subject.save).to eql(true)
    end

    it 'should be valid when given valid attributes' do
      expect(subject).to be_valid
    end

    it 'should fail without a valid user_id' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'should fail without content or an image' do
      subject.content = nil
      expect(subject).to_not be_valid
    end
    
    it 'should be valid with just content' do
      subject.content = "hello"
      expect(subject).to be_valid
    end

    it 'should be valid with just an image' do
      subject.content = nil
      subject.images.create(url: "test")
      expect(subject).to be_valid
    end
  end
end
