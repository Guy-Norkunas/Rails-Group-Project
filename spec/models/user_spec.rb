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
	end
end
