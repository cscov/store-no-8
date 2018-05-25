require 'rails_helper'
require 'rspec'

RSpec.describe Item, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should belong_to(:order) }
end
