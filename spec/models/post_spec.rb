require 'rails_helper'

RSpec.describe Post, type: :model do
  let (:user){User.create(
    username: Faker::JapaneseMedia::SwordArtOnline.game_name,
    email: Faker::Internet.email,
    password: "password123",
    password_confirmation: "password123"
  )}

 

  subject { user.posts.create(
    content: "I have so much test aha"
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
      subject.save
      subject.images.new(url: "testurl")
      expect(subject).to be_valid
    end
  end

  context 'associations' do
    it "should be able to view user associated with post" do
      expect(subject.user.id).to eql(user.id)
    end
  end
end
