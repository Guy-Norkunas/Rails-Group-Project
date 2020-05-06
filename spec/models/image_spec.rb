require 'rails_helper'

RSpec.describe Image, type: :model do
  subject { described_class.new(
      url: "url"
    )}
    
    context 'validations' do
    end
end
