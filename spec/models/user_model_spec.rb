require 'rails_helper'
require 'rspec'
require 'user'

describe :User, :type => :model do
  subject(:user) {
    User.new(first_name: 'Carolyn', email_address: "cscov@email.com")
  }
  let(:user2) {
    User.new(first_name: 'Bob', email_address: "cscov@gmail.com")
  }

  context 'has required attributes' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password) }
    it { should validate_presence_of(:email_address) }
    it { should have_many(:orders) }
  end
  it 'only allows unique email addresses' do
    user.password = '123456'
    expect { :user2.create! }.to raise_error("Email address already exists")
  end
end
