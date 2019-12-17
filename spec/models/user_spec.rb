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
      new_user = User.new(first_name: "name", last_name: 'ln', email: 'me@me.com', password: 'password', password_confirmation: 'passw')
      expect(new_user).not_to be_valid
    end

    it 'cannot be created without a password' do
      new_user = User.new(first_name: "name", last_name: 'ln', email: 'me@me.com', password: nil, password_confirmation: 'passw')
      expect(new_user).not_to be_valid
    end
    
    it 'cannot be created without a password confirmation' do
      new_user = User.new(first_name: "name", last_name: 'ln', email: 'me@me.com', password: 'password', password_confirmation: nil)
      expect(new_user).not_to be_valid
    end
    
    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid if email matches an email in the database, regardless of case' do
      user1 = described_class.create(first_name: 'a', last_name: 'b', email: 'abc@def.com', password: 'password', password_confirmation: 'password')
      user2 = described_class.create(first_name: 'b', last_name: 'c', email: 'abc@def.com', password: 'password1', password_confirmation: 'password1')
      user3 = described_class.create(first_name: 'c', last_name: 'd', email: 'aBc@def.com', password: 'password2', password_confirmation: 'password2')
      expect(user2).not_to be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a first name' do
    end

    it 'is not valid without a last name' do
    end




  end


end
