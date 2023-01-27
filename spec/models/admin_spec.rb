require 'rails_helper'

RSpec.describe Admin, type: :model do
  before :all do
    @user = Account.new(name: 'Tom', email: 'tom@gmail.com', username: 'Tom_M', password: '123456')
    @food = Admin.new(account: @user)
  end

  it 'Name must not be blank' do
    subject.account = nil
    expect(subject).to_not be_valid
  end
end
