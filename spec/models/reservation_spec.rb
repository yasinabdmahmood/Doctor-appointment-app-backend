require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before :all do
    @user = Account.new(name: 'Tom', email: 'tom@gmail.com', username: 'Tom_M', password: '123456')
    @doctor = Doctor.new(name: 'test_name', picture: 'test_picture', speciality: 'test_speciality', bio: 'test_bio')
    @reservation = Reservation.new(account: @user, doctor: @doctor, city: 'paris', date: '2022-5-5')
  end

  it 'account must not be blank' do
    @reservation.account = nil
    expect(subject).to_not be_valid
  end

  it 'doctor must not be blank' do
    @reservation.doctor = nil
    expect(subject).to_not be_valid
  end

  it 'city must not be blank' do
    @reservation.city = nil
    expect(subject).to_not be_valid
  end

  it 'date must not be blank' do
    @reservation.date = nil
    expect(subject).to_not be_valid
  end
end
