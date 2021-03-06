require 'rails_helper'


describe :User, :type => :model do
  subject(:user) {
    User.new(first_name: 'Carolyn', email_address: "cscov@email.com")
  }
  let(:user2) {
    User.create!(first_name: 'Bob', email_address: "cscov@gmail.com")
  }

  context 'has required attributes' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password) }
    it { should validate_presence_of(:email_address) }
    it { should have_many(:orders) }
    it { should have_many(:items) }
  end
  it 'only allows unique email addresses' do
    user.password = '123456'
    expect {
    User.create!(first_name: 'Bob', email_address: "cscov@gmail.com")
  }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
