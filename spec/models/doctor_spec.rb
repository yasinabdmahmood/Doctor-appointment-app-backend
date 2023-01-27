require 'rails_helper'

RSpec.describe Doctor, type: :model do
  before :all do
    @doctor = Doctor.new(name: 'test_name', picture: 'test_picture', speciality: 'test_speciality', bio: 'test_bio')
  end

  it 'name must not be blank' do
    @doctor.name = nil
    expect(subject).to_not be_valid
  end

  it 'picture must not be blank' do
    @doctor.picture = nil
    expect(subject).to_not be_valid
  end

  it 'speciality must not be blank' do
    @doctor.speciality = nil
    expect(subject).to_not be_valid
  end

  it 'bio must not be blank' do
    @doctor.bio = nil
    expect(subject).to_not be_valid
  end
end
