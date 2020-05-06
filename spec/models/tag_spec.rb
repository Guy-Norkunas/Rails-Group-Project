require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject { described_class.new(
    tag: 'Test Product',
	)}
	
	context 'validations' do

		it 'should exist with valid attributes' do
			expect(subject).to be_valid
		end

		it 'should not exist when length > 30' do
			subject.tag = "temp"*10
			expect(subject).to_not be_valid
		end

		it 'should not exist when tag is nil' do
			subject.tag = nil
			expect(subject).to_not be_valid
		end
	end

end
