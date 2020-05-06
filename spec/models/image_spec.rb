require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:user){User.create(
    username: "test",
    email: "name@email.com",
    password: "password123",
    password_confirmation: "password123"
  )}

  subject { user.images.new(
      url: "valid_url"
    )}
    
  context 'validations' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'should be invalid with short url' do
      subject.url = "s"
      expect(subject).to_not be_valid
    end

    it 'should be invalid with no url' do
      subject.url = nil
      expect(subject).to_not be_valid
    end

    it 'should not be possible to use duplicate url' do
      subject.save
      temp = user.images.new(url: "valid_url")
      expect(temp).to_not be_valid
    end
    
  end
end
