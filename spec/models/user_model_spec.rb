require 'rails_helper'

Rspec.describe :User, :type => :model do
  context 'has required attributes' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password) }
  end
  it { should have_many(:orders) }
end
