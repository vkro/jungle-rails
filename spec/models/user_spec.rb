require 'rails_helper'

RSpec.describe User, type: :model do

  subject { described_class.new(first_name: "name", last_name: 'ln', email: 'me@me.com', password: 'password', password_confirmation: 'password')}

  describe 'Validations' do

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid if password_confirmation does not match password field' do
      subject.password_confirmation = 'xdpassword'
      expect(subject).not_to be_valid
    end

    it 'cannot be created if password is less than 8 characters' do
      subject.password = 'passwor'
      subject.password_confirmation = 'passwor'
      expect(subject).not_to be_valid
    end

    it 'cannot be created without matching password and password_confirmation' do
    end

    it 'is not valid without a password' do
    end

    it 'is not valid without a password_confirmation' do
    end

    it 'is not valid if email matches an email in the database, regardless of case' do
    end

    it 'is not valid without an email' do
    end

    it 'is not valid without a first name' do
    end

    it 'is not valid without a last name' do
    end




  end


end
