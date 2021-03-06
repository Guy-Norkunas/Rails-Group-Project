require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
		username: "guy",
		email: "guy@gmail.com",
		password: "password123",
		password_confirmation: "password123"
	)}
	
	context 'validations' do
    it 'should exist when given valid attributes' do
      expect(subject.save).to eql(true)
    end

    it 'should be valid when given valid attributes' do
      expect(subject).to be_valid
    end

    it 'should not be created without a username' do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it 'should not be created without a username' do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it 'should not be created with short email' do
      subject.email = "a@a"
      expect(subject).to_not be_valid
    end

    it 'should not be created without status' do
      subject.status = nil
      expect(subject).to_not be_valid
    end

    it 'should not exist if username is taken' do
      temp_user = described_class.create(
        username: "guy",
        email: "random_email@gmail.com",
        password: "password321",
        password_confirmation: "password321"
      )
      expect(temp_user).to_not be_valid
    end
  end
  
  context 'associations' do
    it 'should be able to make posts through user' do
      subject.save
      temp = subject.posts.create(content: "pls work")
      expect(temp).to be_valid
    end

    it "user can't make invalid posts" do
      subject.save
      temp = subject.posts.create(content: nil)
      expect(temp).to_not be_valid
    end

    it "user can make images" do
      subject.save
      temp = subject.images.new(url: "super unique url")
      expect(temp).to be_valid
    end

    it "user can't make invalid images" do
      subject.save
      temp = subject.images.create(url: nil)
      expect(temp).to_not be_valid
    end
  end
end
