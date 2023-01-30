require 'rails_helper'

RSpec.describe Account, type: :model do
  subject { Account.new(name: 'Tom', email: 'tom@gmail.com', username: 'Tom_M', password: '123456') }
  before { subject.save }
  it 'Name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email must not be blank' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'username must not be blank' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'password must not be blank' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
